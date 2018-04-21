From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Apr 2018 14:51:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 18.0.1
In-Reply-To: <20180421091943.459-1-bernd.kuhls@t-online.de>
References: <20180421091943.459-1-bernd.kuhls@t-online.de>
Message-ID: <20180421145144.1407e97a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Apr 2018 11:19:43 +0200, Bernd Kuhls wrote:
> Removed patch 0002, upstream committed a different fix:
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=18.1&id=cbee1bfb34274668a05995b9d4c78ddec9e5ea4c
> https://cgit.freedesktop.org/mesa/mesa/commit/?h=18.1&id=5a75019ad0270a974788a9b8648ba98ff4203768
> 
> Renumbered patch 0003 -> 0002.
> 
> Tested using test-pkg (removed skipped toolchains from log):
> 
>                 armv5-ctng-linux-gnueabi [ 1/46]: OK
>               armv7-ctng-linux-gnueabihf [ 2/46]: OK
>                         br-aarch64-glibc [ 3/46]: OK
>                            br-arcle-hs38 [ 4/46]: OK
>                   br-arm-cortex-a9-glibc [ 6/46]: OK
>                    br-arm-cortex-a9-musl [ 7/46]: OK
>                              br-arm-full [ 9/46]: OK
>                    br-i386-pentium4-full [12/46]: OK
>                 br-i386-pentium-mmx-musl [13/46]: OK
> 
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
>  ...ness-detection-with-musl-based-toolchains.patch | 70 ----------------------
>  ...c-invert-order-for-wayland-scanner-check.patch} |  0
>  package/mesa3d/mesa3d.hash                         | 10 ++--
>  package/mesa3d/mesa3d.mk                           |  2 +-
>  5 files changed, 7 insertions(+), 77 deletions(-)
>  delete mode 100644 package/mesa3d/0002-Fix-endianess-detection-with-musl-based-toolchains.patch
>  rename package/mesa3d/{0003-configure.ac-invert-order-for-wayland-scanner-check.patch => 0002-configure.ac-invert-order-for-wayland-scanner-check.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
