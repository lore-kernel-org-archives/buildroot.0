From: =?ISO-8859-1?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Fri, 11 Jul 2014 10:57:49 +0200
Subject: [Buildroot] PACKAGE_USERS does not work
Message-ID: <i5np0ra770dn4ujwdmsweh48.1405067942517@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I added a custom package (upmpdcli) to buildroot which I can cleanly build, except of adding a user with UPMPDCLI_USERS.?

I am using the same syntax as the package avahi for the definition, ?where the user avahi is in fact added to the users table.?

define?UPMPDCLI_USERS
upmdpcli -1 upmpdcli -1 * - - -?
endef

Any idea??
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140711/2d4c0ea2/attachment.html>
