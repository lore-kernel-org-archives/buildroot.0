From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 May 2013 11:08:39 +0200
Subject: [Buildroot] [PATCH 1/2] gstreamer1: Add gstreamer version 1.0.7
 package
In-Reply-To: <1368057893-20874-1-git-send-email-spenser@gillilanding.com>
References: <1368057893-20874-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130509110839.684d4037@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed,  8 May 2013 19:04:52 -0500, Spenser Gilliland wrote:

> diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
> new file mode 100644
> index 0000000..b1fd8b1
> --- /dev/null
> +++ b/package/multimedia/gstreamer1/Config.in
> @@ -0,0 +1,37 @@
> +config BR2_PACKAGE_GSTREAMER1
> +	bool "gstreamer1"
> +	depends on BR2_USE_WCHAR # glib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  GStreamer is an open source multimedia framework.
> +
> +	  http://gstreamer.freedesktop.org/

Is it possible to build/install gstreamer and gstreamer1 side by side?
I.e, I'm wondering if we should make those two mutually exclusive
choices, or if we can let the user select both if needed.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
