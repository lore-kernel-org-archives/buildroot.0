From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 10:01:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2016-02-19
In-Reply-To: <871t86cvak.fsf@dell.be.48ers.dk>
References: <20160220073017.2A200101DA7@stock.ovh.net>
 <1455997702.5444.6.camel@embedded.rocks>
 <20160221000639.512d7658@free-electrons.com>
 <871t86cvak.fsf@dell.be.48ers.dk>
Message-ID: <20160221100114.591bd29e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 21 Feb 2016 09:38:43 +0100, Peter Korsgaard wrote:

>  > Yes, it is really a work-around, but it is so much simpler than adding
>  > a BR2_TOOLCHAIN_HAS_GCC_BUG_58952, selecting it for all broken
>  > toolchain + adding the autobuilder exceptions that are needed to also
>  > exclude the custom external toolchains that are affected.
> 
>  > (Not sure Peter will agree, since my proposal is not the cleanest
>  > solution, but it's by far the one with the least impact.)
> 
> Yes, I agree - And preferably send the patch upstream as well!

Well, in essence, this patch will not be accepted upstream. It is a
crappy work-around for a compiler bug, so it would be very logical for
upstream to reject this patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
