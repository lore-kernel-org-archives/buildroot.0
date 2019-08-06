From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Aug 2019 21:37:24 +0200
Subject: [Buildroot] [PATCH 1/6] autobuild-run: use different output
 directories for reproducible builds testing
In-Reply-To: <20190806181251.21885-1-itsatharva@gmail.com>
References: <20190806181251.21885-1-itsatharva@gmail.com>
Message-ID: <20190806213724.33e3f302@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  6 Aug 2019 23:42:46 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> Having different output directories increases variation in the build.
> 
> This commit also changes the directory name of the single output directory to
> "output-1", as having varied length names for output directories introduces a
> lot of reproducibility issues.
> 
> Official Debian efforts also currently use same length names for different
> directories: "/build/1st/$pkg-$ver" and "/build/$pkg-$ver/2nd"
> Cfr: https://tests.reproducible-builds.org/debian/index_variations.html

Is this an intermediate step, with the long term goal of supporting
output directories of different length, or is this a limitation that we
will have "forever" ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
