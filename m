From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 4 Nov 2016 12:38:22 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/openvpn: bump to version
 2.3.13
In-Reply-To: <20161104055255.22119-1-bernd.kuhls@t-online.de>
References: <20161104055255.22119-1-bernd.kuhls@t-online.de>
Message-ID: <20161104103822.yfryw3753bwtrf6z@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Fri, Nov 04, 2016 at 06:52:55AM +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/openvpn/openvpn.hash | 4 ++--
>  package/openvpn/openvpn.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
> index ce005d3..0c5cb09 100644
> --- a/package/openvpn/openvpn.hash
> +++ b/package/openvpn/openvpn.hash
> @@ -1,2 +1,2 @@
> -# Locally calculated after checking pgp signature
> -sha256	13b963414e2430215981868c77b9795d93653ee535a2d73576f7bb2c28200abc 	openvpn-2.3.12.tar.xz
> +# Locally calculated
> +sha256 9cde0c8000fd32d5275adb55f8bb1d8ba429ff3de35f60a36e81f3859b7537e0  openvpn-2.3.13.tar.xz

Why not check the signature? It's at 
https://swupdate.openvpn.org/community/releases/openvpn-2.3.12.tar.xz.asc .

baruch

> diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
> index 0e59fdc..cd0a2d1 100644
> --- a/package/openvpn/openvpn.mk
> +++ b/package/openvpn/openvpn.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -OPENVPN_VERSION = 2.3.12
> +OPENVPN_VERSION = 2.3.13
>  OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
>  OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
>  OPENVPN_DEPENDENCIES = host-pkgconf openssl

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
