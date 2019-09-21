From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 23:05:57 +0200
Subject: [Buildroot] [PATCH v6 10/25] package/kodi-audiodecoder-*: mass
 version bump
In-Reply-To: <20190921192826.10143-11-bernd.kuhls@t-online.de>
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-11-bernd.kuhls@t-online.de>
Message-ID: <c0607061-3873-27f3-e0aa-9831f4c7af69@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 21:28, Bernd Kuhls wrote:
[snip]
> diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> index fb7003f093..46011d7d39 100644
> --- a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> +++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -KODI_AUDIODECODER_MODPLUG_VERSION = 1.1.0
> -KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,v$(KODI_AUDIODECODER_MODPLUG_VERSION))
> +KODI_AUDIODECODER_MODPLUG_VERSION = 2aee0cf2bd8fb6d82fb32dae71f9372e0345d695

 Same remark as in kodi proper: why not use a tag like was done before?

 Regards,
 Arnout

[snip]
