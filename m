From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Tue, 3 May 2016 21:53:19 +0200
Subject: [Buildroot] [PATCH 3/3] gst1-plugins-bad: add rtmp support
In-Reply-To: <1462304656-17156-3-git-send-email-gustavo@zacarias.com.ar>
References: <1462304656-17156-1-git-send-email-gustavo@zacarias.com.ar>
 <1462304656-17156-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <572901AF.6030003@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 03.05.2016 um 21:44 schrieb Gustavo Zacarias:
> As pointed by sonnex on the mailing list.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in           | 6 ++++++
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 53ce589..5248c4d 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -382,6 +382,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
>  	help
>  	  Removes silence from an audio stream
>  
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
> +	bool "rtmp"
> +	select BR2_PACKAGE_RTMPDUMP
> +	help
> +	  RTMP plugni

just caught that typo while looking at the patch...
