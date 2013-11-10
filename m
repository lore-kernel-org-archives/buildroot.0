From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Nov 2013 00:37:27 +0100
Subject: [Buildroot] rootfs: add U-Boot image support for cpio + lots of
	refactoring
In-Reply-To: <1383779555-9222-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 7 Nov 2013 00:12:28 +0100")
References: <1383779555-9222-1-git-send-email-arnout@mind.be>
Message-ID: <87ppq7akw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

>  This patch series is based on Spenser Gilliland's patch that adds U-Boot
> image support to the root filesystem images. It was decided at the BR
> developer meeting that this is only ever going to be useful for cpio
> images (to be used as an initramfs), so I rewrote the patch to that end.
> But then I saw lots and lots of refactoring opportunities, which in the
> end led to this 7-patch series.

>  I have only compile-tested the cpio image, Spenser can you do a runtime
> test on the Zedboard? Your defconfig should still work.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
