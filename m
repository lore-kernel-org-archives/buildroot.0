From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:09:16 +0200
Subject: [Buildroot] [PATCH 2/2] sdl2_image: bump to version 2.0.5
In-Reply-To: <20190923194002.17371-2-peter.macleod.thompson@gmail.com>
References: <20190923194002.17371-1-peter.macleod.thompson@gmail.com>
 <20190923194002.17371-2-peter.macleod.thompson@gmail.com>
Message-ID: <20190923230916.4adb0aef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Mon, 23 Sep 2019 13:40:02 -0600
Peter Thompson <peter.macleod.thompson@gmail.com> wrote:

> From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> 
> bump sdl2_image from version 2.0.3 to version 2.0.5
> for upgrade to latest version
> 
> Signed-off-by: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_image/sdl2_image.hash | 5 ++---
>  package/sdl2_image/sdl2_image.mk   | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
> index cf3253526c..69a9eab872 100644
> --- a/package/sdl2_image/sdl2_image.hash
> +++ b/package/sdl2_image/sdl2_image.hash
> @@ -1,3 +1,2 @@
> -# Locally calculated
> -sha256 3510c25da735ffcd8ce3b65073150ff4f7f9493b866e85b83738083b556d2368  SDL2_image-2.0.3.tar.gz
> -sha256 13240ed78c8726c510b9634976430d3d3a9ea2d1ced3214119766e9e71568a35  COPYING.txt

Why are you dropping the license file hash ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
