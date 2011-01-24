From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 24 Jan 2011 09:58:21 +0100
Subject: [Buildroot] [PATCH 3rd RESEND 6/6] Add gst-omapfb package
In-Reply-To: <1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	(Felipe Contreras's message of "Mon, 24 Jan 2011 00:41:35 +0200")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
Message-ID: <87lj2ahe4y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
 Felipe> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

And here.

Thinking a bit more about it - For the omap3 stuff, they are all with A8
cores, so we could even do 'depends on BR2_cortex_a8', right?

 Felipe> diff --git a/package/multimedia/gst-omapfb/Config.in b/package/multimedia/gst-omapfb/Config.in
 Felipe> new file mode 100644
 Felipe> index 0000000..e4a62c0
 Felipe> --- /dev/null
 Felipe> +++ b/package/multimedia/gst-omapfb/Config.in
 Felipe> @@ -0,0 +1,7 @@
 Felipe> +config BR2_PACKAGE_GST_OMAPFB
 Felipe> +	bool "gst-omapfb"
 Felipe> +	depends on BR2_PACKAGE_GSTREAMER
 Felipe> +	help
 Felipe> +	  GStreamer plug-in to use OMAP framebuffer.

Is this omap3 specific like the rest, or would it also work on E.G. the
pandaboard?

-- 
Bye, Peter Korsgaard
