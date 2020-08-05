From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 14:39:01 +0200
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: enable for cortexa7
In-Reply-To: <20200731090231.246132-1-eugen.hristev@microchip.com>
References: <20200731090231.246132-1-eugen.hristev@microchip.com>
Message-ID: <20200805143901.602019cc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 31 Jul 2020 12:02:31 +0300
Eugen Hristev <eugen.hristev@microchip.com> wrote:

> Enable this bootloader for cortex a7 based SoCs
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> 
> This is in preparation for our upcoming sama7g5 SoC featuring cortex A7.

This would have been good to have in the commit log itself, to explain
the "why" of the change. So I've tweaked the commit log, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
