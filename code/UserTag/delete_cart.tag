# Copyright 2002-2007 Interchange Development Group and others
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.  See the LICENSE file for details.
# 
# $Id: delete_cart.tag,v 1.5.2.1 2007-03-31 00:20:18 pajamian Exp $

UserTag delete_cart Order     nickname
UserTag delete_cart AttrAlias name nickname
UserTag delete_cart Version   $Revision: 1.5.2.1 $
UserTag delete_cart Routine   <<EOR
sub {
	my($nickname) = @_;

	$Tag->userdb({function => 'delete_cart', nickname => $nickname});

	return '';
}
EOR
