From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 11:07:58 +0200
Subject: [Buildroot] [PATCH 1/1] v4l2loopback: enable required kernel
 options
In-Reply-To: <20200411222542.64271-1-james.hilliard1@gmail.com>
References: <20200411222542.64271-1-james.hilliard1@gmail.com>
Message-ID: <20200412110758.208a4683@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello James,

On Sat, 11 Apr 2020 16:25:42 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Fixes:
> ERROR: "video_ioctl2" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "__video_register_device" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "v4l2_ctrl_new_custom" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "v4l2_ctrl_handler_init_class" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "video_device_release" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "video_device_alloc" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "v4l2_device_register" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "v4l2_ctrl_handler_free" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "v4l2_device_unregister" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "video_unregister_device" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> ERROR: "video_devdata" [/home/buildroot/buildroot/output/build/v4l2loopback-0.12.4/./v4l2loopback.ko] undefined!
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks James. I'm going to mark this one as Changes Requested, as we
are soon going to merge the series from Yann that reworks how we handle
the interaction between enabled packages and kernel config options, see:

  http://patchwork.ozlabs.org/project/buildroot/list/?series=168565

If you can resend on top of this series, it would be ideal. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
