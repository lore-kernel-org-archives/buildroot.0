From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 12 Apr 2008 11:34:27 +0000
Subject: [Buildroot] uclibc snapshot vs. stable config
Message-ID: <1208000067.6817.562.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Seems uclibc snapshot is a little off from the current stable config.

May be an idea to add uclibc-snapshot.config ? just like
uclibc-VERSION.config . This should prevent make stopping to ask for
config options.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080412/5d455def/attachment-0001.pgp 
