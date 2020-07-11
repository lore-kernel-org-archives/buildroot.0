From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jul 2020 15:27:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 20.1.3
In-Reply-To: <20200710051521.55075-1-bernd.kuhls@t-online.de>
References: <20200710051521.55075-1-bernd.kuhls@t-online.de>
Message-ID: <20200711152705.1497dd20@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Jul 2020 07:15:21 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Renumbered patches, rebased patch 0003.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk                    | 2 +-
>  ...c99_math-import-isinf-for-uclibc-based-toolchains.patch} | 0
>  .../0003-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch | 6 +++---
>  package/mesa3d/mesa3d.hash                                  | 6 +++---
>  package/mesa3d/mesa3d.mk                                    | 2 +-
>  5 files changed, 8 insertions(+), 8 deletions(-)
>  rename package/mesa3d/{0003-c99_math-import-isinf-for-uclibc-based-toolchains.patch => 0002-c99_math-import-isinf-for-uclibc-based-toolchains.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
