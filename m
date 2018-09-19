From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Sep 2018 16:20:49 +0200
Subject: [Buildroot] [RFC PATCH v3 1/1] support/kconfig: Bump to kconfig
 from Linux 4.17-rc2
In-Reply-To: <20180919140756.GA2353@x230>
References: <20180919113615.27036-1-petr.vorel@gmail.com>
 <20180919152848.616fc616@windsurf> <20180919140756.GA2353@x230>
Message-ID: <20180919162049.7067401e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Sep 2018 16:07:57 +0200, Petr Vorel wrote:

> Sure :). v2 build all code no matter whether it was actually needed. E.g. 'make
> menuconfig' built gconf (gtk) or qconf (qt). That's a bug you pointed out in
> [1].  I fixed it in v3. It was caused by removing ifeq clauses.
> Here is the diff v2 vs. v3:

Aah, OK. Much clearer explanation, thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
