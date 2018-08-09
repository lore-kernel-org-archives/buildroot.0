From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:57:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/systemd: fix statx support with
 glibc >= 2.28
In-Reply-To: <20180803181425.18106-1-romain.naour@gmail.com>
References: <20180803181425.18106-1-romain.naour@gmail.com>
Message-ID: <20180809235750.407788dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Romain,

On Fri,  3 Aug 2018 20:14:24 +0200, Romain Naour wrote:
> Backport 2 patches fixing statix redefinition:

                            ^^^^^ statx

> +Subject: [PATCH 3/4] build-sys: Detect whether struct statx is defined in
> + sys/stat.h

> +Subject: [PATCH 4/4] meson: unify linux/stat.h check with other checks and use
> + _GNU_SOURCE

Please generate your patches with git format-patch -N to avoid the
numbering in the patch titles.

I've applied to next after fixing those two minor issues. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
