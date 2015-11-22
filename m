From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 13:35:28 +0100
Subject: [Buildroot] Analysis of build results for 2015-11-21
In-Reply-To: <20151122100315.GT19876@waldemar-brodkorb.de>
References: <20151122073011.8CA87102679@stock.ovh.net>
 <20151122105711.185037f6@free-electrons.com>
 <20151122100315.GT19876@waldemar-brodkorb.de>
Message-ID: <20151122133528.6d1fbbf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Nov 2015 11:03:15 +0100, Waldemar Brodkorb wrote:

> > This is a uClibc issue which was affected a number of architectures.
> > Has it been fixed already for ARC ? Waldemar, Alexey ?
> 
> Should be fixed by using a recent ARC toolchain with uClibc-ng
> 1.0.9. Update the ARC toolchains :)

Good. In fact I've already rebuilt all the toolchains, I just need to
deploy them. Will hopefully get to this later today.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
