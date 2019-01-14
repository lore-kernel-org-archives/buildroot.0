From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Mon, 14 Jan 2019 10:24:58 +0100
Subject: [Buildroot] [PATCH 1/1] hiredis: bump to version 0.14.0
In-Reply-To: <20190114065210.13406-1-fontaine.fabrice@gmail.com>
References: <20190114065210.13406-1-fontaine.fabrice@gmail.com>
Message-ID: <c813713a-2c63-7482-c757-8b0d4f3beae7@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14.01.19 07:52, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/hiredis/hiredis.hash | 2 +-
>   package/hiredis/hiredis.mk   | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/hiredis/hiredis.hash b/package/hiredis/hiredis.hash
> index 682ec6d2b0..7478ae0f24 100644
> --- a/package/hiredis/hiredis.hash
> +++ b/package/hiredis/hiredis.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256	717e6fc8dc2819bef522deaca516de9e51b9dfa68fe393b7db5c3b6079196f78	hiredis-v0.13.3.tar.gz
> +sha256	042f965e182b80693015839a9d0278ae73fae5d5d09d8bf6d0e6a39a8c4393bd	hiredis-v0.14.0.tar.gz
>   sha256	dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb	COPYING
> diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
> index dd75742229..e187aed52c 100644
> --- a/package/hiredis/hiredis.mk
> +++ b/package/hiredis/hiredis.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -HIREDIS_VERSION_MAJOR = 0.13
> -HIREDIS_VERSION = v$(HIREDIS_VERSION_MAJOR).3
> +HIREDIS_VERSION_MAJOR = 0.14
> +HIREDIS_VERSION = v$(HIREDIS_VERSION_MAJOR).0
>   HIREDIS_SITE = $(call github,redis,hiredis,$(HIREDIS_VERSION))
>   HIREDIS_LICENSE = BSD-3-Clause
>   HIREDIS_LICENSE_FILES = COPYING
> 

Hi,

Does it make sense to also bump redis itself to 5.x then?
