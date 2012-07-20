From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jul 2012 00:37:17 +0200
Subject: [Buildroot] [PATCH 2/2] Add MXS bootlets package
In-Reply-To: <1342627363-3941-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1342627363-3941-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342627363-3941-2-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <20120721003717.1bdf540f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 18:02:43 +0200,
Maxime Ripard <maxime.ripard@free-electrons.com> a ?crit :

> MXS platforms (imx23 and imx28) are relying on bootlets as their first
> stage bootloaders, that can then either start a regular second stage
> bootloader or directly a Linux kernel. However, the Makefile allows
> only to build u-boot and linux images at the same time, which is
> not very convenient as we will more likely use only one of them,
> so we need to duplicate a bit what is already done so that we are able
> to choose what we want to generate.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Applied with minor fixes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
