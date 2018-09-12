From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:38:12 +0200
Subject: [Buildroot] [PATCH 0/2] support for RISC-V architecture
In-Reply-To: <ff182eac-12ea-7ad6-df8c-8ec9c257fece@aries-embedded.de>
References: <ff182eac-12ea-7ad6-df8c-8ec9c257fece@aries-embedded.de>
Message-ID: <20180912233812.6696430b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Anton,

On Sat, 14 Jul 2018 09:09:38 +0200, Anton Kuzmin wrote:
> This patch set adds basic support for RISC-V ISA.
> 
> Only 64-bit glibc toolchain/sdk are built at the moment.

Thanks for this patch series. I missed it back then, but in the mean
time, Mark Corbin has proposed a more complete patch series adding
RISC-V support:

  http://patchwork.ozlabs.org/project/buildroot/list/?series=65306

I'll mark your series as Superseded in our patch tracking system. Could
you look at Mark's proposal, and see if it works for you as well ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
