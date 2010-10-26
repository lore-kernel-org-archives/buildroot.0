From: Sergio Monteiro Basto <sergio@sergiomb.no-ip.org>
Date: Tue, 26 Oct 2010 18:27:04 +0100
Subject: [Buildroot] ncurses should have libtinfo.so
Message-ID: <1288114024.13545.6.camel@segulix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, 
First, I saw that you fix vsftpd, thanks

About ncurses , IRC xdialog needs libtinfo.so, so ncurses should be
compile with libtinfo.so

in attach is my propose patch 

Thanks, 
-- 
S?rgio M. B.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ncurses.patch
Type: text/x-patch
Size: 595 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101026/b3085e98/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3309 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101026/b3085e98/attachment-0001.bin>
