From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 21:24:17 +0100
Subject: [Buildroot] out of tree kernel patches question
In-Reply-To: <trinity-0d97f4a0-c1ac-416e-bfea-7bcafcb3ce1d-1510924577452@3c-app-mailcom-bs07>
References: <trinity-0d97f4a0-c1ac-416e-bfea-7bcafcb3ce1d-1510924577452@3c-app-mailcom-bs07>
Message-ID: <20171117212417.43162ed7@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Nov 2017 14:16:17 +0100, daggs wrote:

> when it comes to the odroidc2 support, there are 3 things that I'm concerned about:
> 1. gcc is limited to 4.9.x
> 2. old uboot (2005.11).
> 3. very old kernel (3.14.79).
> 
> #1 is needed because #2, currently upstream uboot support this board
> from 2007.05 but I've tried for months to get upstream uboot to work
> with the vendor's kernel without any luck. unfortunately, the uboot
> mailing list isn't helpful at all (no one seems to care much), this
> means that in order to solve issue #2, the kernel needs to be
> upgraded.

> latest upstream kernel holds bask support for this board, the
> development is progressing. now assuming that I take patches existing
> in the kernel mailing list that adds missing support for features in
> the kernel to a point that the board can be used in a decent manner,
> what is the policy of adding out of the kernel patches to a board in
> buildroot?

We are generally OK to integrate kernel patches if they are merged
upstream already, or seriously on their way upstream. Also, we can do
this only if the stack of patches is not several hundreds of patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
