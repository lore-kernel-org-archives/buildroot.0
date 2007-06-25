From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 26 Jun 2007 01:45:42 +0300 (EEST)
Subject: [Buildroot] PATCH: cairo DirectFB support
Message-ID: <37659.127.0.0.1.1182811542.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I intend to add GTK2 support via DirectFB to buildroot.
The patch in the attachment enables cairo package to be built with DirectFB backend support.
Default cairo dependency on BR2_PACKAGE_XORG is unchanged.

Upgrade to cairo-1.4.4 eliminate the need for patches:
0001-Add-autoconf-macro-AX_C_FLOAT_WORDS_BIGENDIAN.patch
0002-Change-_cairo_fixed_from_double-to-use-the-magic-number-technique.patch

Best regards,
Ivan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: cairo-patch-DirectFB_support.diff
Type: application/octet-stream
Size: 9858 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070626/f7be08b0/attachment.obj 
