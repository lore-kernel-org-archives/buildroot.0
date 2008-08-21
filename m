From: Wade Berrier <wberrier@gmail.com>
Date: Thu, 21 Aug 2008 13:36:49 -0600
Subject: [Buildroot] [PATCH] fix keeping includes in Makefile.autotools.in
Message-ID: <1219347409.7367.22.camel@wberrierlx.appsig.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Makefile.autotools.in refers to an old configuration option:
BR2_HAVE_INCLUDES.

(I ran into this because headers were missing from my target filesystem)

Attached is the patch to remove that option.  (I say remove instead of
switching it to B2_HAVE_DEVFILES because BR2_HAVE_DEVFILES is handled in
buildroot/Makefile.  Unless there's a reason to handle the includes in
both spots?)

Wade
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-autotools_keep_includes.patch
Type: text/x-patch
Size: 535 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080821/de73bbf7/attachment.bin 
