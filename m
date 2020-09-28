From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Sep 2020 22:23:30 +0200
Subject: [Buildroot] [PATCH 2/3] support/scripts/gen-bootlin-toolchains:
 add missing glibc toolchain dependencies
In-Reply-To: <20200927143752.1498115-2-romain.naour@gmail.com>
References: <20200927143752.1498115-1-romain.naour@gmail.com>
 <20200927143752.1498115-2-romain.naour@gmail.com>
Message-ID: <20200928222330.395b681a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Sep 2020 16:37:51 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> glibc toolchains must be disabled for MMU less configuration.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I am wondering if this one really makes sense. If there is a Bootlin
toolchain that exists for a given architecture, then it really does
exist. So adding another BR2_USE_MMU dependency here feels useless, no?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
