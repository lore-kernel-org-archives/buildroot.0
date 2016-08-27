From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 21:46:20 +0200
Subject: [Buildroot] [PATCH 06/16 v3] core: introduce a generated
 kconfig snippet
In-Reply-To: <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e4930f24c2ca2291b55d122df292702136feb91e.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827214620.1dd7d0db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:26 +0200, Yann E. MORIN wrote:

> +.PHONY: $(BUILD_DIR)/.br2-external.in
> +$(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> +	@touch $@

I've added a comment that explains why this target is PHONY, and
applied this patch to the next branch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
