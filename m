From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Fri, 03 Nov 2017 03:33:04 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5BPATCH_1/1=5D_package/dtc=3A_qemu_s?=
 =?iso-8859-1?q?ystem_build_need_libfdt=2E?=
In-Reply-To: <09523a7a-0125-4c10-bb29-e15cfa00165f@cesnet.cz>
References: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
 <09523a7a-0125-4c10-bb29-e15cfa00165f@cesnet.cz>
Message-ID: <cecbedfb-98a5-4b52-a59b-3129c7e0da51@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

...and here's a simple patch against U-Boot which fixes the build for me. 
It seems that U-Boot is special in Buildroot when it comes to patch 
handling. I also don't know whether it's reasonable to patch it like this 
instead of not installing libfdt from the DTC. I also looked at U-Boot's 
patchwork and noticed that there's aparently an active series where someone 
is refactoring libfdt wrappers.

TL;DR: it's a mess. This fixes stuff for me, feel free to pick in any way 
you feel is appropriate.

My mail with this patch to upstream U-Boot is in a moderation queue, so I'm 
posting it at least here.

Cheers,
Jan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uboot-no-system-libfdt.patch
Type: text/x-patch
Size: 1223 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171103/92a2928e/attachment.bin>
