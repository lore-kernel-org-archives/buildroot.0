From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 14:01:49 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/libqb: needs threads and dynamic library
In-Reply-To: <20210716210432.342503-1-fontaine.fabrice@gmail.com>
References: <20210716210432.342503-1-fontaine.fabrice@gmail.com>
Message-ID: <20210718140149.530ca4e1@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 16 Jul 2021 23:04:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> libqb fails to build without threads or dynamic library since the
> addition of the package in commit
> 22864d570dd18d78a77dedab8fbcc5e0122c0acc
> 
> Also add ac_cv_prog_cc_c99=-std=gnu99 to fix build failure without wchar
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/21c1b5d29da4949f4582056ab4e2335ec225d8d6
>  - http://autobuild.buildroot.org/results/aa4df6364cdf3c862be13b6b738595f420ec6105
>  - http://autobuild.buildroot.org/results/376d316094238ba7097e8bdc51960ba38532683a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Fix title (static -> dynamic)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
