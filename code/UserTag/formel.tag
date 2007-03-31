# Copyright 2002-2007 Interchange Development Group and others
# Copyright 2002-2005 Stefan Hornburg (racke@linuxia.de)
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.  See the LICENSE file for details.
# 
# $Id: formel.tag,v 1.12.2.1 2007-03-31 00:20:18 pajamian Exp $

UserTag formel Order   label name type size
UserTag formel addAttr
UserTag formel Version $Revision: 1.12.2.1 $
UserTag formel Routine <<EOF
sub {
	my ($label, $name, $type, $size, $opt) = @_;
	my ($labelhtml, $elhtml, $fmt);
	my $contrast = $::Variable->{CONTRAST} || 'red';
	my $checkfor = $opt->{'checkfor'} || $name;
	my $sizestr = '';
	my $labelproc;

	$labelproc = sub {
		my ($label, $keep) = @_;
		my ($error);

		if ($opt->{cause}) {
			if ($error = $Tag->error({name => $checkfor, keep => 1})) {
				$label .= $Tag->error({name => $checkfor, keep => $keep, 
						text => $opt->{cause}});
			}
		}
		else {
			$error = $Tag->error({name => $checkfor, keep => $keep});
		}

		if ($error) {
			if ($opt->{signal}) {
				sprintf($opt->{signal}, $label);
			}
			else {
				qq{<font color="$contrast">$label</font>};
			}	
		}
		else {      
			$label;
		}
	};

	# set defaults
	$type = 'text' unless $type;

	for ('cause', 'format', 'order', 'reset', 'signal', 'size') {
		next if $opt->{$_};
		if ($::Values->{"mv_formel_$_"}) {
			$opt->{$_} = $::Values->{"mv_formel_$_"};
		}   
	}

	if ($opt->{'format'}) {
		$fmt = $opt->{'format'};
	}
	else {
		$fmt = '%s %s %s';
	}

	if ($opt->{'size'}) {
		if ($type eq 'textarea') {
			my ($cols, $rows) = split (/\s*[,x\s]\s*/, $opt->{'size'});
			$sizestr = qq{ rows="$rows" cols="$cols"};
		}
		else {
			$sizestr = qq{ size="$opt->{size}"};
		}
	}

	if ($opt->{'maxlength'}) {
		$sizestr .= qq{ maxlength="$opt->{maxlength}"};
	}

	if ($type eq 'radio' || $type eq 'checkbox') {		
		my ($rlabel, $rvalue, $select, @vals);
		
		if ($type eq 'checkbox') {
			@vals = split(/\0/, $::Values->{$name});
		}

		for my $button (split (/\s*,\s*/, $opt->{choices})) {
			$select = '';
			if ($button =~ /^(.*?)=(.*)$/) {
				$rvalue = $1;
				$rlabel = $2;
			}
			else {
				$rvalue = $rlabel = $button;
			}

			if ($type eq 'checkbox') {
				# multiple values possible for checkboxes
				for my $val (@vals) {
					if ($val eq $rvalue) {
						$select = 'checked';
						last;
					}
				}
			} elsif ($::Values->{$name} eq $rvalue) {
				$select = ' checked';
			}

			$rlabel = &$labelproc($rlabel, 1);

			$elhtml .= qq{<input type="$type" name="$name" value="${rvalue}"$select> $rlabel};
		}
		# delete error implicitly
		$labelhtml = &$labelproc($label);
		return sprintf ($fmt, $labelhtml, $elhtml);
	}

	$labelhtml = &$labelproc($label) if $label || $type ne 'display';

	if ($type eq 'select') {
		my ($rlabel, $rvalue, $select);

		for my $option (split (/\s*,\s*/, $opt->{choices})) {
			$select = '';
			if ($option =~ /^(.*?)=(.*)$/) {
				$rvalue = $1;
				$rlabel = $2;
			}
			else {
				$rvalue = $rlabel = $option;
			}

			if ($::Values->{$name} eq $rvalue) {
				$select = ' selected';
			}
			if ($rvalue eq $rlabel) {	
				$elhtml .= qq{<option $select>$rlabel};
			}
			else {
				$elhtml .= qq{<option value="$rvalue"$select>$rlabel};
			}
		}
		return sprintf ($fmt, $labelhtml, 
				qq{<select name="$name">$elhtml</select>});
	}

	if ($type eq 'display') {
		if ($label) {
			# use provided label
			$elhtml = $Tag->display($opt->{table} || 'products', $name, '', 
					{value => $Values->{$name}});
		}
		else {
			# use dummy template to retrieve label from metadata
			$elhtml = $Tag->display($opt->{table} || 'products', $name, '', 
					{value => $Values->{$name}, 
					template => join(" \0", '$LABEL$', '$WIDGET$')});
			($label, $elhtml) = split(/\s\0/, $elhtml);
			$labelhtml = &$labelproc($label);
		}
	} elsif ($opt->{reset}) {
		if ($type eq 'textarea') {
			$elhtml = qq{<textarea name="${name}"$sizestr></textarea>};
		}
		else {
			$elhtml = qq{<input type="$type" name="${name}"$sizestr>};
		}
	}
	else {
		if ($type eq 'textarea') {
			$elhtml = qq{<textarea name="${name}"$sizestr>$::Values->{$name}</textarea>};
		}
		else {
			$elhtml = qq{<input type="$type" name="$name" value="$::Values->{$name}"$sizestr>};
		}
	}

	if ($opt->{order}) {
		# display form element first
		sprintf ($fmt, $elhtml, $labelhtml, $opt->{help});
	}
	else {
		# display label first
		sprintf ($fmt, $labelhtml, $elhtml, $opt->{help});
	}
}
EOF
