From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 22:19:25 +0200
Subject: [Buildroot] [PATCH] package/bayer2rgb-neon: bump version
In-Reply-To: <20190403211231.99053-1-giulio.benetti@micronovasrl.com>
References: <20190403211231.99053-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190404221925.7faa6db5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Giulio,

On Wed,  3 Apr 2019 23:12:31 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> Actually build fails with musl libc due to missing header inclusion
> <unistd.h> (usually included by stdlib.h) in package code which in order
> contains type definition of ssize_t.
> A Git repository has been setted up for this project as upstream, and
> contains a commit which solves build failure removing the use of ssize_t
> at all.
> No other http tarballs have been released on current site, so
> development seems to continue on Git repository.
> 
> - Set SITE_METHOD = git
> - Switch site to: https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb
> - Bump version to latest commit to include commit which fixes build
>   failure.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c84/c84b65642cb1b2d246f3a92ac957af5c5fcb86e8/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Do we have an indication of what is the real upstream location for this
project ?

You're saying "a Git repo has been set up for this project as
upstream". What indication you have that this is the most "official"
upstream ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
