From: =?utf-8?q?=C3=98yvind_Repvik?= <repvik@kynisk.com>
Date: Mon, 30 Apr 2007 03:57:10 +0200
Subject: [Buildroot] [PATCH] e2fsprogs symlinking
In-Reply-To: <200704300307.58865.repvik@kynisk.com>
References: <200704300307.58865.repvik@kynisk.com>
Message-ID: <200704300357.11087.repvik@kynisk.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ooops, that patch was slightly wrong. Corrected patch attached.

?yvind

On Monday 30 April 2007 03:07:58 ?yvind Repvik wrote:
> Hi,
>
> 	When e2fsprogs is installed, it duplicates several binaries, which isn't
> really very space efficient. This patch removes these duplicate binaries
> and replaces them with symlinks pointing to the original binary.
> This saves 448kb on an uncompressed rootfs.
>
> Regards,
> ?yvind Repvik


-------------- next part --------------
A non-text attachment was scrubbed...
Name: e2fsprogs_symlinks.diff
Type: text/x-diff
Size: 942 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070430/2e555861/attachment.bin 
