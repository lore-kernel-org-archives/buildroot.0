From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Apr 2020 22:18:29 +0200
Subject: [Buildroot] [PATCH 1/2] support/testing: add openssh runtime
 test
In-Reply-To: <7e3327f8-57d2-679f-1f7c-2cdfbfb5bf04@smile.fr>
References: <20200330162411.9678-1-romain.naour@smile.fr>
 <20200331233206.632dcfce@windsurf.home>
 <cd51a10f-21ea-7395-91ec-093ae03f41d4@smile.fr>
 <20200402141614.54c9d1b6@windsurf.home>
 <adbf598c-fea8-1176-53e2-ac9a85ef981c@smile.fr>
 <20200402214133.3d5ba92c@windsurf.home>
 <7e3327f8-57d2-679f-1f7c-2cdfbfb5bf04@smile.fr>
Message-ID: <20200402221829.61d73328@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2 Apr 2020 22:04:00 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> My point is that we don't test with different gcc/binutils version and different
> libc implementation. But we have to use the same architecture since the Qemu
> command line is specific to the emulated architecture. If a test would be
> available for several architecture it would require to update the qemu command
> line (and the kernel configuration too).
> 
> At least testing with several gcc and libc implementation would be good enough?

But would you do that for all tests ?

If you take our 172 existing tests, then run all of them on 3 different
libcs, 3 different gcc versions, you suddenly have 1548 test cases. And
that's just for *one* architecture.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
