From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Nov 2017 13:22:43 +0200
Subject: [Buildroot] [PATCH next] musl: bump to 1.1.18
In-Reply-To: <20171127101732.14622-1-thomas.petazzoni@free-electrons.com>
References: <20171127101732.14622-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171127112243.76qgr57fupq3uer3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Nov 27, 2017 at 11:17:32AM +0100, Thomas Petazzoni wrote:
> diff --git a/package/musl/musl.hash b/package/musl/musl.hash
> index f3f3741092..db89a72c45 100644
> --- a/package/musl/musl.hash
> +++ b/package/musl/musl.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated after checking pgp signature

Having a link to the signature here would be nice:

   http://www.musl-libc.org/releases/musl-1.1.18.tar.gz.asc

> -sha256	937185a5e5d721050306cf106507a006c3f1f86d86cd550024ea7be909071011  musl-1.1.16.tar.gz
> +sha256	d017ee5d01aec0c522a1330fdff06b1e428cb409e1db819cc4935d5da4a5a118  musl-1.1.18.tar.gz
> diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> index 6d5603398b..b1aace0400 100644
> --- a/package/musl/musl.mk
> +++ b/package/musl/musl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MUSL_VERSION = 1.1.16
> +MUSL_VERSION = 1.1.18
>  MUSL_SITE = http://www.musl-libc.org/releases
>  MUSL_LICENSE = MIT
>  MUSL_LICENSE_FILES = COPYRIGHT

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
