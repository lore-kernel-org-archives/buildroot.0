From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:33:13 +0200
Subject: [Buildroot] [PATCH v2 1/2] mtd: bump to version 2.0.0
In-Reply-To: <1496955910-32315-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1496955910-32315-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170620223313.2fe37c1d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Jun 2017 23:05:08 +0200, Thomas Petazzoni wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> MTD Tools was bumped to version 2.0 after over a decade of being at
> 1.5.2.
> 
> This revision includes:
>   - Moving from a handwritten makefile to autotools.
>   - Restructuring and cleaning up the source tree.
>   - Fixing the problems that the patches in the package/mtd directory fixed.
> 
> Changes:
>   - Move from generic-package to autotools-package in mtd.mk.
>   - Remove no longer necessary patches.
>   - Update binary locations in mtd.mk
>   - Update library/header locations in mtd.mk
>   - Remove MTD_ADD_MISSING_LINTL definition from mtd.mk, as it's no longer
>     needed.
> 
> Tested with toolchains compiled with musl, uclibc, and glibc.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

[snip]

I've applied both patches to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
