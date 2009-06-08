From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Jun 2009 20:07:31 +0200
Subject: [Buildroot] [PATCH 2/2] Add target support for MXC based devices
In-Reply-To: <20090608152648.GL29236@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 8 Jun 2009 17\:26\:48 +0200")
References: <1244473080-8195-1-git-send-email-daniel@caiaq.de>
	<1244473080-8195-2-git-send-email-daniel@caiaq.de>
	<87prdesr1a.fsf@macbook.be.48ers.dk>
	<20090608152648.GL29236@buzzloop.caiaq.de>
Message-ID: <87hbyqsios.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> From 3c1b25d96ee33c1d1c8b5b8f6f7a8c48d28cb353 Mon Sep 17 00:00:00 2001
 Daniel> From: Daniel Mack <daniel@caiaq.de>
 Daniel> Date: Mon, 8 Jun 2009 17:22:04 +0200
 Daniel> Subject: [PATCH] Add support for Freescale's MXC serial terminals

 Daniel> This patch makes ttymxc0 an option to choose for
 Daniel> BR2_TARGET_GENERIC_GETTY.

Do all SoCs using the ttymxc driver really all only have 1 uart?

 Daniel> +/dev/ttymxc	c	666	0	0	207	16	0	1	3

Apparently not as you're here creating 3 nodes.

-- 
Bye, Peter Korsgaard
