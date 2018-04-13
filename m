From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Apr 2018 10:17:34 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add dependency on
 elfutils for R600 with LLVM
In-Reply-To: <CAGbXN6KP1_EoY+q0_y7OrE4kuuEmPOVA=G2BNSn_8NyqxbJtpA@mail.gmail.com>
References: <20180412213200.3553280F77@busybox.osuosl.org>
 <CAGbXN6KP1_EoY+q0_y7OrE4kuuEmPOVA=G2BNSn_8NyqxbJtpA@mail.gmail.com>
Message-ID: <20180413101734.0ebdb28d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Apr 2018 10:16:19 +0200, Micha? Kalbarczyk wrote:

> Just figured out that you're creating a PR with gallium R600 driver. I'm
> trying do the same thing with RADEONSI driver.
> Can you add radeonsi driver to your PR, or should I create separate PR for
> that ?

We don't do "PR" in Buildroot, we send patches over e-mail. I'm not
sure Valentin has the hardware to test RadeonSI, so if you're
interested by RadeonSI, please send your patches :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
