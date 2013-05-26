From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 May 2013 19:52:26 +0200
Subject: [Buildroot] [PATCH v8 10/10] gst-omx: add gst-omx package
In-Reply-To: <1369588343-13950-11-git-send-email-spenser@gillilanding.com>
References: <1369588343-13950-1-git-send-email-spenser@gillilanding.com>
 <1369588343-13950-11-git-send-email-spenser@gillilanding.com>
Message-ID: <20130526195226.266ad882@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sun, 26 May 2013 12:12:23 -0500, Spenser Gilliland wrote:

> diff --git a/package/multimedia/gst-omx/gst-omx-config-files.patch b/package/multimedia/gst-omx/gst-omx-config-files.patch
> new file mode 100644
> index 0000000..74c247b
> --- /dev/null
> +++ b/package/multimedia/gst-omx/gst-omx-config-files.patch
> @@ -0,0 +1,123 @@
> +Index: gst-omx-1.0.0/config/bellagio/gstomx.conf
> +===================================================================

We want all patches to have a description + signed-off-by line. See all
other package patches in Buildroot.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
