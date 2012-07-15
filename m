From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Jul 2012 23:12:23 +0200
Subject: [Buildroot] [PATCH v5 1/2] usb_modeswitch: update to 1.2.3
In-Reply-To: <1332034235-17423-2-git-send-email-jwoltz@gmail.com>
References: <1332034235-17423-1-git-send-email-jwoltz@gmail.com>
 <1332034235-17423-2-git-send-email-jwoltz@gmail.com>
Message-ID: <20120715231223.5a77873f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[ Reviving an old thread... ]

Le Sat, 17 Mar 2012 21:30:34 -0400,
"J.C. Woltz" <jwoltz@gmail.com> a ?crit :

> This patch updates usb_modeswitch to version 1.2.3.
> The usb_modeswitch.mk needed to be modified for usb_modeswitch to compile.
> Also added extra remove section for the added help scripts and files.
> 
> Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> replace TARGET_MAKE_ENV and add USB_MODESWITCH_UNINSTALL_CMDS
> as recommended by Arnout Vandecappelle

Why do you use TARGET_MAKE_ENV here? It seems much better to use
TARGET_CONFIGURE_OPTS as you were doing in previous versions of your
patch. Arnout, can you explain why you suggested using TARGET_MAKE_ENV
instead of TARGET_CONFIGURE_OPTS?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
