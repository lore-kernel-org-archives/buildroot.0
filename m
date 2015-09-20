From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 15:05:05 +0200
Subject: [Buildroot] [PATCH] arc: add HS38 VDK virtual boards
In-Reply-To: <1441724062-27521-1-git-send-email-abrodkin@synopsys.com>
References: <1441724062-27521-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20150920150505.3743ee98@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Tue,  8 Sep 2015 17:54:22 +0300, Alexey Brodkin wrote:
> Virtualizer Development Kits (VDKs) are software development kits
> containing design-specific virtual prototypes as well as debug and
> analysis tools and sample software.

Are these publicly available? I.e can we run ourselves these
configurations under the virtualizer?

I was going to apply this patch, but I'm not sure it's really useful to
have a SMP and a non-SMP configuration for exactly the same platform.
We typically don't have multiple configurations for the same platform:
people can always go ahead and enable/disable whatever they want in the
kernel configuration.

What is the motivation for having both? Is the SMP-capable kernel not
working on the non-SMP emulated hardware?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
