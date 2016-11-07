From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 21:59:33 +0100
Subject: [Buildroot] [PATCH 07/14] gst1-plugins-bad: enable webrtc plugin
In-Reply-To: <1478167120-3285-7-git-send-email-gustavo@zacarias.com.ar>
References: <1478167120-3285-1-git-send-email-gustavo@zacarias.com.ar>
 <1478167120-3285-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161107215933.1c0d5efe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 06:58:33 -0300, Gustavo Zacarias wrote:

> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC
> +	bool "webrtc"
> +	# All depends from webrtc-audio-processing
> +	depends on BR2_arm || BR2_i386 || BR2_x86_64

I've also added a preparation patch on webrtc-audio-processing to add a
BR2_PACKAGE_WEBRTC_AUDIO_PROCESSING_ARCH_SUPPORTS hidden boolean to
avoid duplicating the list of architecture dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
