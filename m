From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:03:18 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/kodi-inputstream-adaptive:
 bump version to 2.0.18
In-Reply-To: <20170923120243.24993-1-bernd.kuhls@t-online.de>
References: <20170923120243.24993-1-bernd.kuhls@t-online.de>
Message-ID: <2f2c31c2-950f-fbe7-b6ea-6e24eaf80bd7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-09-17 14:02, Bernd Kuhls wrote:
> Fixes https://bugs.busybox.net/show_bug.cgi?id=10256
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied series to master, thanks.

 Regards,
 Arnout

> ---
> v2: fixed hash
> 
>  package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash | 2 +-
>  package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk   | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> index df717ef056..0d8f39f6cc 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> @@ -1,2 +1,2 @@
>  # Locally computed
> -sha256 764941d87aa99408c48d91b5ddf237cd0251fb4cbafba3da188bb4a965220309  kodi-inputstream-adaptive-161f319bb2cd946f4659d841a54f19b1fb6143cc.tar.gz
> +sha256 a214b6f47d4fcd0ceb78819447eb9ff3c5b4519233a46a245c9b558ecda0725f  kodi-inputstream-adaptive-f2904b547e940c724dce7412a26744c2698cab66.tar.gz
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index 8d7daefc4f..cc0950346e 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -4,7 +4,9 @@
>  #
>  ################################################################################
>  
> -KODI_INPUTSTREAM_ADAPTIVE_VERSION = 161f319bb2cd946f4659d841a54f19b1fb6143cc
> +# This cset is on the branch 'Krypton'
> +# When Kodi is updated, then this should be updated to the corresponding branch
> +KODI_INPUTSTREAM_ADAPTIVE_VERSION = f2904b547e940c724dce7412a26744c2698cab66
>  KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,peak3d,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
>  KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = src/main.cpp
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
