From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 21:35:23 +0100
Subject: [Buildroot] [PATCH 50/51] arch/xtensa: accept the overlay to be
 an URL
In-Reply-To: <fb88a640d6ca2ceb85fc96fa73a960af848c8930.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <fb88a640d6ca2ceb85fc96fa73a960af848c8930.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <20151123213523.2668237d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 23 Nov 2015 15:48:20 +0100, Yann E. MORIN wrote:

> +# No need for a conditional here, the variable will be enpty when
> +# there is no URL to download.
> +$(1)_EXTRA_DOWNLOADS += $$(ARCH_XTENSA_OVERLAY_URL)

If all EXTRA_DOWNLOADS files are saved as part of legal-info, then you
can get rid of patches 38, 39 and 40.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
