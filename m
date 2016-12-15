From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Dec 2016 15:34:19 +0200
Subject: [Buildroot] [PATCH] rapidjson: bump to 1.1.0
In-Reply-To: <1481807702-11531-1-git-send-email-luca@lucaceresoli.net>
References: <1481807702-11531-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <20161215133419.ia3aetxglcw56amg@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca,

On Thu, Dec 15, 2016 at 02:15:02PM +0100, Luca Ceresoli wrote:
> ---

Your SoB is missing.

baruch

>  package/rapidjson/rapidjson.hash | 2 +-
>  package/rapidjson/rapidjson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rapidjson/rapidjson.hash b/package/rapidjson/rapidjson.hash
> index baaced9..bde8319 100644
> --- a/package/rapidjson/rapidjson.hash
> +++ b/package/rapidjson/rapidjson.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256 c3711ed2b3c76a5565ee9f0128bb4ec6753dbcc23450b713842df8f236d08666  rapidjson-v1.0.2.tar.gz
> +sha256 bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e  rapidjson-v1.1.0.tar.gz
> diff --git a/package/rapidjson/rapidjson.mk b/package/rapidjson/rapidjson.mk
> index 5da407b..d06f529 100644
> --- a/package/rapidjson/rapidjson.mk
> +++ b/package/rapidjson/rapidjson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RAPIDJSON_VERSION = v1.0.2
> +RAPIDJSON_VERSION = v1.1.0
>  RAPIDJSON_SITE = $(call github,miloyip,rapidjson,$(RAPIDJSON_VERSION))
>  RAPIDJSON_LICENSE = MIT
>  RAPIDJSON_LICENSE_FILES = license.txt

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
