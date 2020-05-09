From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 21:58:01 +0200
Subject: [Buildroot] [PATCH] package/piglit: bump version
In-Reply-To: <20200504120132.3161950-1-romain.naour@gmail.com>
References: <20200504120132.3161950-1-romain.naour@gmail.com>
Message-ID: <20200509215801.33f9d0a9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  4 May 2020 14:01:32 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Remove upstream patch [1].
> 
> This version bump contain a patch removing EGL_NO_CONFIG_MESA [2] that
> trigger a build issue with recent Mesa version.
> 
> Update indentation of hash file (two spaces).
> 
> Fixes:
> http://autobuild.buildroot.net/results/8ed/8ede89a673f83896745f90fd51458cac5fe7bb8f
> 
> [1] https://gitlab.freedesktop.org/mesa/piglit/-/commit/8417ca1725d523493d8f6782699273dc056888ac
> [2] https://gitlab.freedesktop.org/mesa/piglit/-/commit/1fe351e533a1c8b88551b06e6d76e5c2bf8228bc
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Maybe we should also bump piglit package for each mesa version bump since
> there is no official release: https://piglit.freedesktop.org
> ---
>  ...tests-fix-test-build-requiring-gles3.patch | 49 -------------------
>  package/piglit/piglit.hash                    | 10 ++--
>  package/piglit/piglit.mk                      |  2 +-
>  3 files changed, 6 insertions(+), 55 deletions(-)
>  delete mode 100644 package/piglit/0001-tests-fix-test-build-requiring-gles3.patch

Applied to master because it fixes a build issue. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
