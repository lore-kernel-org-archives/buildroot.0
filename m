From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 4 Nov 2020 09:37:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-plugins-bad:
 fix typo
In-Reply-To: <20201104073940.490327-1-fontaine.fabrice@gmail.com>
References: <20201104073940.490327-1-fontaine.fabrice@gmail.com>
Message-ID: <20201104093753.3c59ef76@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Wed,  4 Nov 2020 08:39:40 +0100, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> dvdsub{enc,overlay} -> dvbsub{enc,overlay}
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 305e0fda2f..191820df1d 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -88,12 +88,12 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DEBUGUTILS
>  	  debugging
>
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBENC
> -	bool "dvdsubenc"
> +	bool "dvbsubenc"
>  	help
>  	  DVB subpicture encoding support
>
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_DVBSUBOVERLAY
> -	bool "dvdsuboverlay"
> +	bool "dvbsuboverlay"
>  	help
>  	  DVB subtitle renderer plugin
>

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
