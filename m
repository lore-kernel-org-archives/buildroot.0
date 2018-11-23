From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 10:56:31 +0100
Subject: [Buildroot] [PATCH v1] imx-usb-loader: bump version to 4aa9809
In-Reply-To: <20181122193635.8550-1-ps.report@gmx.net>
References: <20181122193635.8550-1-ps.report@gmx.net>
Message-ID: <20181123105631.33936202@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Nov 2018 20:36:35 +0100, Peter Seiderer wrote:
> Fixes imx-usb-loader usability for i.MX6 QP (failes with the current
> version/patch stack).
> 
> Changes since e539461:
> 
>   9a88413 portable.h: fix build with gcc older than 4.8
>   bf25425 add mx6ull_usb_work.conf
>   1041959 correct commit "portable.h: fix build with gcc older than 4.8"
>   f000130 mx6ull_usb_work.conf: fix copy/paste error in comment
>   e99a093 portable: fix typo s/&&/&/ in BE16 fix
>   eed0280 portable: use __builtin_bswap16 for BE16 if >= 4.8 GNUC
>   95fe112 imx_usb: fix type on imx_usb help
>   4aa9809 imx_uart: fix type on help
> 
> Remove upstream applied patch ([1]):
> 
>  - 0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
> 
> [1] https://github.com/boundarydevices/imx_usb_loader/commit/9a88413996c6cfa8b903641f2f52b3fe487595cc
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ....h-fix-build-with-gcc-older-than-4.8.patch | 47 -------------------
>  package/imx-usb-loader/imx-usb-loader.hash    |  2 +-
>  package/imx-usb-loader/imx-usb-loader.mk      |  3 +-
>  3 files changed, 3 insertions(+), 49 deletions(-)
>  delete mode 100644 package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch

Since this fixes some actual runtime issues, and the number of commits
upstream is very limited, I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
