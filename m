From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 10:33:44 +0200
Subject: [Buildroot] [PATCH 1/6] autobuild-run: use different output
 directories for reproducible builds testing
In-Reply-To: <8265074.T7ehH8mb2W@msi-manjaro>
References: <20190806181251.21885-1-itsatharva@gmail.com>
 <20190806213724.33e3f302@windsurf.home>
 <8265074.T7ehH8mb2W@msi-manjaro>
Message-ID: <20190807103344.47590808@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 07 Aug 2019 11:32:52 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> > Is this an intermediate step, with the long term goal of supporting
> > output directories of different length, or is this a limitation that we
> > will have "forever" ?  
> 
> Reproducible-Builds has proposed a spec called BUILD_PATH_PREFIX_MAP to help 
> with this. However, that is still in the works and not fully solved yet. (As 
> told to Yann and I on the #reproducible-builds IRC)
> 
> See: https://wiki.debian.org/ReproducibleBuilds/GCC-build-path and https://
> reproducible-builds.org/specs/build-path-prefix-map/
> 
> So I think until further work is done on BUILD_PATH_PREFIX_MAP, we will have 
> to stay with output directories of same length.

OK, thanks for the additional explanation. These details would have
been useful to have in the commit log I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
