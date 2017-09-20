From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Sep 2017 19:35:14 +0200
Subject: [Buildroot] [PATCH 1/1] Update github hashes
In-Reply-To: <20170920112825.3971-1-bernd.kuhls@t-online.de>
References: <20170920112825.3971-1-bernd.kuhls@t-online.de>
Message-ID: <20170920173514.GB2717@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-09-20 13:28 +0200, Bernd Kuhls spake thusly:
> It seems github now sometimes provides slightly changed tarballs which
> produce a different sha256 hash than before. Fix the hashes of the
> affected packages to avoid downloading from sources.buildroot.net.

Sigh...

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/freerdp/freerdp.hash                                            | 2 +-
>  .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash            | 2 +-
>  .../kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash    | 2 +-
>  package/kodi/kodi.hash                                                  | 2 +-
>  package/libasplib/libasplib.hash                                        | 2 +-
>  package/mongoose/mongoose.hash                                          | 2 +-
>  package/python-mwscrape2slob/python-mwscrape2slob.hash                  | 2 +-
>  package/rpi-userland/rpi-userland.hash                                  | 2 +-
>  package/sunxi-cedarx/sunxi-cedarx.hash                                  | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
> index 2ced373b38..a713f77bb8 100644
> --- a/package/freerdp/freerdp.hash
> +++ b/package/freerdp/freerdp.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 1db496cca391f76382ef284db2d0306d5c15bf515ee2c964319c22272d969a32  freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.tar.gz
> +sha256 a0e3b203bcc0f38fa8b20318f6e5df3661419b119079bd95d737b66dd1ac4205  freerdp-17834af7bb378f85a3b3cc4dcadaa5125a337e16.tar.gz
> diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> index f9d400459e..15d3e347f1 100644
> --- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> +++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
> @@ -1,2 +1,2 @@
>  # locally computed
> -sha256	0d45472a967d747bc1948b0332f77c8cd9f6ec1620b0922e82ca5ddd053b40ea  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
> +sha256 f18b826fd25328adf6b4405f48fdf0eaaddc77bb79c0dee76cd8c28aa8ffc078  kernel-module-imx-gpu-viv-a05d9b23b9902f6ce87d23772de2fdb2ecfb37a7.tar.gz
> diff --git a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
> index ff9d6d0244..1d0ef080a6 100644
> --- a/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
> +++ b/package/kodi-screensaver-crystalmorph/kodi-screensaver-crystalmorph.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 a8400c8d8be0fe0ba616ad1d0ef5fd798980a9dd4e38ef88bee9bf74a06975d5  kodi-screensaver-crystalmorph-1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e.tar.gz
> +sha256 b99aa6295c8dc6afd0dd22991e611ecc8e9b97aff3a44b905911515609e903ea  kodi-screensaver-crystalmorph-1dc9bf3f57cc2c5345efec64d9499c3bf8f7bd6e.tar.gz
> diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
> index 6c7cf8f615..0dc46133ee 100644
> --- a/package/kodi/kodi.hash
> +++ b/package/kodi/kodi.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256 b05e11b2d108222bfc3ff0c9a466d798c0feedf1228166239948e6ed37c3cb4f  kodi-17.4-Krypton.tar.gz
> +sha256 6b0886e7449fc201e0ec0584b37f9f654c429797a41e6d0b6a4b5a7fd5ec34dc  kodi-17.4-Krypton.tar.gz
>  # Locally computed - libdvdcss
>  sha256 b6eb2d929ff56cb051152c32010afc5e7cf5fe8c5ae32dca412a2b46b6b57e34  2f12236.tar.gz
>  # Locally computed - libdvdnav
> diff --git a/package/libasplib/libasplib.hash b/package/libasplib/libasplib.hash
> index 76534e528d..df8161489b 100644
> --- a/package/libasplib/libasplib.hash
> +++ b/package/libasplib/libasplib.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 68e117348fa17592dde7672477e927119a0e477103ced1d3a57d92e30880a147  libasplib-be7fac89218a84b75f7598e3d76625ece99296f2.tar.gz
> +sha256 c97aa3591a2f4c91a8a3d008e1874cf6a4d3fdcdb71e08cf24b391f328b59254  libasplib-be7fac89218a84b75f7598e3d76625ece99296f2.tar.gz
> diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
> index d5252eb687..92bbf80bb9 100644
> --- a/package/mongoose/mongoose.hash
> +++ b/package/mongoose/mongoose.hash
> @@ -1,2 +1,2 @@
>  # Locally computed:
> -sha256	ccc971298db70963d3f13766c3246a3c36ae7e388acfab7ba2180149d9c8c64f  mongoose-6.7.tar.gz
> +sha256 7033c4c9ad0aac2aaa53864ff0bee5468a327a78a3218fb753d55a426a791189  mongoose-6.7.tar.gz
> diff --git a/package/python-mwscrape2slob/python-mwscrape2slob.hash b/package/python-mwscrape2slob/python-mwscrape2slob.hash
> index f1f5e4f166..89b32fe679 100644
> --- a/package/python-mwscrape2slob/python-mwscrape2slob.hash
> +++ b/package/python-mwscrape2slob/python-mwscrape2slob.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 367ffc3203f7eb2cc26211f58c0693526652d9a238af48c88f936920e804faf7  python-mwscrape2slob-0f9124ed62009dff6a230947d80340f5a61a6f49.tar.gz
> +sha256 2b111d6faba4e439fdd383da952f3e8fb5760fc6794a9d1ef5dc6f0e080afe7f  python-mwscrape2slob-0f9124ed62009dff6a230947d80340f5a61a6f49.tar.gz
> diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
> index 1728ae8712..e8a78b95fa 100644
> --- a/package/rpi-userland/rpi-userland.hash
> +++ b/package/rpi-userland/rpi-userland.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 476cde13d0d4bbf44ffc4d1d545847464d5c270bb72e4d940e43e5972c4de9da rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
> +sha256 46a37eaf0de598ce5804e48a5efc2120e07d753a57ed83463ebfa551562eefe6 rpi-userland-29835184aa70c13d77a11d721e934a7298bdf46a.tar.gz
> diff --git a/package/sunxi-cedarx/sunxi-cedarx.hash b/package/sunxi-cedarx/sunxi-cedarx.hash
> index 048b868982..f40a6449fc 100644
> --- a/package/sunxi-cedarx/sunxi-cedarx.hash
> +++ b/package/sunxi-cedarx/sunxi-cedarx.hash
> @@ -1,2 +1,2 @@
>  # locally computed
> -sha256  ea7426f83325d247ba0d4734eaf1cb53bab178a81f935e2535ddb3069f70ba84  sunxi-cedarx-b8f52d913f73720e50d8f1b2f8610467b575dc45.tar.gz
> +sha256  e674a3b88b12cabc0aaa97c9fdcd898b712daedb549eb49bbf6d1c851c0791f0  sunxi-cedarx-b8f52d913f73720e50d8f1b2f8610467b575dc45.tar.gz
> -- 
> 2.11.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
