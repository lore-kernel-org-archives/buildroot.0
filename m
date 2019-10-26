From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 11:32:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/subversion: bump version to
 1.12.2
In-Reply-To: <20190929183412.11686-1-bernd.kuhls@t-online.de>
References: <20190929183412.11686-1-bernd.kuhls@t-online.de>
Message-ID: <20191026113239.3f2e015f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Sep 2019 20:34:12 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added dependencies to lz4 and utf8proc, the latter needs
> http://patchwork.ozlabs.org/patch/1169012/
> 
> Added patch to fix build error because macos-specific variables were
> not addressed by AC_SUBST.
> 
> Updated license hash after various upstream commits:
> https://github.com/apache/subversion/commits/trunk/LICENSE
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0003-cross-compilation-macos.patch        | 103 ++++++++++++++++++

This is a complicated patch, which is needed because our current 0002
patch is already complicated. I've replaced the current 0002 and your
0003 patch by a much simpler, one-liner solution. And applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
