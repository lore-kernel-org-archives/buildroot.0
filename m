From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:51:54 +0100
Subject: [Buildroot] [PATCH] m68k: add special gcc flag to avoid ICE for
 coldfire
In-Reply-To: <c7f2be5d-3849-d30b-bf39-731477bc1927@mind.be>
References: <20161126085144.GA23223@waldemar-brodkorb.de>
 <20161126145224.2aa5ef33@free-electrons.com>
 <c7f2be5d-3849-d30b-bf39-731477bc1927@mind.be>
Message-ID: <20161211155154.55553108@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 14:59:34 +0100, Arnout Vandecappelle wrote:

>  Begging to differ: doing the same without patch 683830 would be a much bigger
> patch (adding yet another -D option to the wrapper, updating the wrapper
> itself). But OK, it's getting a bit later to still take _any_ risk, so probably
> the bigger patch is better.

Have you had the chance to work on your toolchain wrapper patches, at
least enough to be able to merge this m68k change?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
