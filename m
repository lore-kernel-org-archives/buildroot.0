From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 15 Nov 2008 11:56:01 +0100
Subject: [Buildroot] [PATCH] u-boot: add config option to disable
	patching
In-Reply-To: <87od0ijunz.fsf@macbook.be.48ers.dk>
References: <200811140854.58814.markus.heidelberg@web.de>
	<87od0ijunz.fsf@macbook.be.48ers.dk>
Message-ID: <200811151156.02393.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 14.11.2008:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
>  Markus> The patches in target/u-boot/ can conflict with custom board specific
>  Markus> patches, so this option is necessary.
> 
> But there aren't any patches under target/u-boot?

I use Atmel's buildroot for AVR32, they added a patch there. Then do you think
we should just delete the 3 patch-kernel.sh lines I've surrounded with the new
option because it is never used?

Markus
