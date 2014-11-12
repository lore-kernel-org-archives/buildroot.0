From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Nov 2014 13:33:41 +0100
Subject: [Buildroot] [PATCH] uClibc: ARC: enable generic string
	implementations
In-Reply-To: <1415789721.10608.6.camel@abrodkin-8560l.internal.synopsys.com>
References: <1415616842-7640-1-git-send-email-abrodkin@synopsys.com>
 <20141110135034.2e03b27c@free-electrons.com>
 <1415789721.10608.6.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20141112133341.00298ed8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 12 Nov 2014 10:55:22 +0000, Alexey Brodkin wrote:

> I agree that it's better to not have this kind of generic options
> selected by architectures.
> 
> But the point is I don't have any real hardware except ARC and ARM
> boards (Cubieboard2 & Wandboard Quad).
> 
> For ARC I do see improvements and still stable behavior of toolchain and
> target binaries.
> 
> For ARM I don't see any difference in LMbench because most if not all
> string routines are already implemented in assembly, sio the option in
> question makes no sense.
> 
> But for other architectures like BlackFin, PPC, MIPS difference could be
> in both performance and stability but this is something I cannot test.
> 
> So volunteers are more than welcome.
> 
> But what if nobody else cares?

If nobody cares, then we just enable the option. And people will
complain when/if it breaks for them.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
