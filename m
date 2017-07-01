From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:13:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 17.1.4
In-Reply-To: <20170701080933.26646-1-bernd.kuhls@t-online.de>
References: <20170701080933.26646-1-bernd.kuhls@t-online.de>
Message-ID: <20170701101303.4c78132d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Jul 2017 10:09:33 +0200, Bernd Kuhls wrote:
> Removed patch 0001, applied upstream:
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=17.1&id=0069a613ac3b6ca75315cbb2fd3d86b0f6c9ede4
> 
> Renumbered remaining patches.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
>  ...atform.h-not-installed-if-EGL-is-disabled.patch | 39 ----------------------
>  ...ch => 0001-Fix-runtime-error-with-uClibc.patch} |  0
>  .../mesa3d/{0003-musl.patch => 0002-musl.patch}    |  0
>  ...ess-detection-with-musl-based-toolchains.patch} |  0
>  ...c-invert-order-for-wayland-scanner-check.patch} |  0
>  package/mesa3d/mesa3d.hash                         | 10 +++---
>  package/mesa3d/mesa3d.mk                           |  2 +-
>  8 files changed, 7 insertions(+), 46 deletions(-)
>  delete mode 100644 package/mesa3d/0001-Fix-khrplatform.h-not-installed-if-EGL-is-disabled.patch
>  rename package/mesa3d/{0002-Fix-runtime-error-with-uClibc.patch => 0001-Fix-runtime-error-with-uClibc.patch} (100%)
>  rename package/mesa3d/{0003-musl.patch => 0002-musl.patch} (100%)
>  rename package/mesa3d/{0004-Fix-endianess-detection-with-musl-based-toolchains.patch => 0003-Fix-endianess-detection-with-musl-based-toolchains.patch} (100%)
>  rename package/mesa3d/{0005-configure.ac-invert-order-for-wayland-scanner-check.patch => 0004-configure.ac-invert-order-for-wayland-scanner-check.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
