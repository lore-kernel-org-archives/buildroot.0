From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 May 2017 22:49:54 +0200
Subject: [Buildroot] [PATCH] Revert "libcdio: disable on ARC,
 triggers a toolchain bug"
References: <20170516073213.9321-1-abrodkin@synopsys.com>
Message-ID: <isjevdxnfo.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 16 May 2017 10:32:13 +0300 schrieb Alexey Brodkin:

> This reverts commit 459f7302df8cdc45aa0f7f2581ebb6f05fb6432a.
> 
> libcdio building is fixed for ARC in 2b360bd547f1 "gcc: arc-2017.03-rc2:
> Fix "unrecognized supposed constant" error"

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile-tested together with http://patchwork.ozlabs.org/patch/766176/)
