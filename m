From: Julien Boibessot <julien.boibessot@free.fr>
Date: Sun, 09 Nov 2008 22:56:30 +0100
Subject: [Buildroot] [PATCH] Kernel minor patches/sources are never loaded
Message-ID: <49175C8E.2020505@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Kernel.org minor patches/sources are never loaded when trying to compile
mainline kernel and choosing minor revision.

Here is a simple patch to correct that.

Regards,
Julien
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-patches-download.patch
Type: text/x-patch
Size: 755 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081109/98767abe/attachment.bin 
