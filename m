From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 17:27:50 +0100
Subject: [Buildroot] [PATCH 1/4] boot/optee-os: support external TA SDK
In-Reply-To: <20190601153041.6855248e@windsurf>
References: <20190517084556.12242-1-etienne.carriere@linaro.org>
 <20190601153041.6855248e@windsurf>
Message-ID: <20191027172750.77458dad@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Etienne,

On Sat, 1 Jun 2019 15:30:41 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> To be honest, I am not convinced we want to support such a special use
> case. It makes the whole OP-TEE packaging more complicated. I don't
> think we need to support use cases where some random part of the system
> gets built by Buildroot, and another part is built externally.
> 
> So unless you can convince me that the use case is really important, I
> would be tempted to not accepted this patch series. I'm Cc'ing a bunch
> of other folks so that they can share their opinion.

So, this series has been sitting in patchwork for a while, and I am
still not convinced we want to support something like this, and
generally the feedback from other folks at the Buildroot Developers
Meeting is that we should probably not support it.

So, I'll mark the series as Rejected. If you believe you have more
arguments on why this is necessary, what are the use cases, then we can
of course always revisit that decision, since nothing is ever set in
stone.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
