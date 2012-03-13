From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Mar 2012 15:17:54 +0100
Subject: [Buildroot] [PATCH 2/2] u-boot: add support for u-boot.sb file
 format
In-Reply-To: <1331643131-31435-3-git-send-email-eric.jarrige@armadeus.org>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <1331643131-31435-3-git-send-email-eric.jarrige@armadeus.org>
Message-ID: <20120313151754.55dc8629@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 13 Mar 2012 13:52:11 +0100,
Eric Jarrige <eric.jarrige@armadeus.org> a ?crit :

> add u-boot.sb binary format in BR menuconfig - Safe Boot (.sb) file
> format have to be used with Freescale CPUs like imx23, imx28, stp37xx

Forgive my ignorance about this .sb format, but does U-Boot
automatically uses the elftosb tool? I don't see it being directly used
in your patch, so I'm confused.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
