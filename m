From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 21:57:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.4
In-Reply-To: <20200723062437.162724-1-bernd.kuhls@t-online.de>
References: <20200723062437.162724-1-bernd.kuhls@t-online.de>
Message-ID: <20200723215757.2e91df6b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 23 Jul 2020 08:24:37 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Removed patch 0001-musl.patch, upstream added a different fix in 2019:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/da84d071a6f4c33015525c168d22c0f121025010
> 
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
>  ...t-isinf-for-uclibc-based-toolchains.patch} |  0
>  package/mesa3d/0001-musl.patch                | 38 -------------------
>  ...-proper-value-for-LIBCLC_INCLUDEDIR.patch} |  0
>  ...ion-to-disable-optional-neon-suppor.patch} |  0
>  package/mesa3d/mesa3d.hash                    |  6 +--
>  package/mesa3d/mesa3d.mk                      |  2 +-
>  7 files changed, 5 insertions(+), 43 deletions(-)
>  rename package/mesa3d/{0002-c99_math-import-isinf-for-uclibc-based-toolchains.patch => 0001-c99_math-import-isinf-for-uclibc-based-toolchains.patch} (100%)
>  delete mode 100644 package/mesa3d/0001-musl.patch
>  rename package/mesa3d/{0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch => 0002-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch} (100%)
>  rename package/mesa3d/{0004-vc4-add-meson-option-to-disable-optional-neon-suppor.patch => 0003-vc4-add-meson-option-to-disable-optional-neon-suppor.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
