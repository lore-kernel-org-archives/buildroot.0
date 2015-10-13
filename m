From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 23:28:50 +0200
Subject: [Buildroot] [PATCH v1 1/2] gst1-plugins-base: update configure
 options
In-Reply-To: <1444770754-15352-1-git-send-email-ps.report@gmx.net>
References: <1444770754-15352-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151013232850.34cda8d4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 13 Oct 2015 23:12:33 +0200, Peter Seiderer wrote:
> - add '--disable-gio_unix_2_0' to options which require currently
>   unpackaged libraries
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> index 08ebe03..53748ec 100644
> --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> @@ -28,6 +28,7 @@ GST1_PLUGINS_BASE_CONF_OPTS = \
>  # Options which require currently unpackaged libraries
>  GST1_PLUGINS_BASE_CONF_OPTS += \
>  	--disable-cdparanoia \
> +	--disable-gio_unix_2_0 \

Instead gio a glib thingy, provided by our libglib2 package ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
