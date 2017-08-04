From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 23:35:56 +0200
Subject: [Buildroot] [PATCH 07/10] softether: bump to version
 471de39ddf91be0a6a020a68fd6c4c20ef5ba702cb8b5da12ae8350493819ed8
In-Reply-To: <20170804185521.12320-8-Adamduskett@outlook.com>
References: <20170804185521.12320-1-Adamduskett@outlook.com>
 <20170804185521.12320-8-Adamduskett@outlook.com>
Message-ID: <5ec0b1b1-c98b-5406-4601-ef3e364ecfa2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04-08-17 20:55, Adam Duskett wrote:
> While this version isn't 100% compatible with LibreSSL, it makes it much
> easier to apply a small patch that makes it compatible.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/softether/softether.hash | 2 +-
>  package/softether/softether.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/softether/softether.hash b/package/softether/softether.hash
> index 961990baf..2f77df1db 100644
> --- a/package/softether/softether.hash
> +++ b/package/softether/softether.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 4bdcc05fcd163eea735444283264e40b86626d24fddf110aa416f2c8cb82448b softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
> +sha256 471de39ddf91be0a6a020a68fd6c4c20ef5ba702cb8b5da12ae8350493819ed8 softether-e9006faf0c8739147ab97e27fe11c5cdd20ed9e6.tar.gz
> diff --git a/package/softether/softether.mk b/package/softether/softether.mk
> index 33d20c40b..31504cfb1 100644
> --- a/package/softether/softether.mk
> +++ b/package/softether/softether.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SOFTETHER_VERSION = 1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a
> +SOFTETHER_VERSION = e9006faf0c8739147ab97e27fe11c5cdd20ed9e6

 Perhaps use the v4.22-9634-beta tag instead? It feels more like something
upstream considers releasable. Note that the previous version 1e17c9 was
v4.21-9613-beta (but they didn't actually tag that).

 Regards,
 Arnout

>  SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
>  SOFTETHER_LICENSE = GPL-2.0
>  SOFTETHER_LICENSE_FILES = LICENSE
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
