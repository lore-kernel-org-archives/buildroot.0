From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 23:03:53 +0200
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.15.4
In-Reply-To: <20210322194221.1987437-1-francois.perrad@gadz.org>
References: <20210322194221.1987437-1-francois.perrad@gadz.org>
Message-ID: <20210328230353.3443cbfb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Mar 2021 20:42:21 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> remove 2 patches merged upstream
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  ...uild-defaults-to-c99-for-build.c_std.patch | 42 -------------------
>  .../0002-meson.build-fix-static-build.patch   | 37 ----------------
>  package/janet/janet.hash                      |  2 +-
>  package/janet/janet.mk                        |  2 +-
>  4 files changed, 2 insertions(+), 81 deletions(-)
>  delete mode 100644 package/janet/0001-meson.build-defaults-to-c99-for-build.c_std.patch
>  delete mode 100644 package/janet/0002-meson.build-fix-static-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
