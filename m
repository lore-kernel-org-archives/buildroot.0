From: Julien Boibessot <julien.boibessot@free.fr>
Date: Thu, 13 Nov 2008 11:27:01 +0100
Subject: [Buildroot] [PATCH] Kernel minor patches/sources are never loaded
	(v2)
Message-ID: <491C00F5.1020904@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Kernel.org minor patches/sources are never loaded when trying to compile
mainline kernel and choosing minor revision.

Here is a modified version of my previous patch (thanks to Bernhard R-F remarks).

Regards,
Julien

-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-patches-download.patch
Type: text/x-patch
Size: 1186 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081113/5f295fde/attachment.bin 
