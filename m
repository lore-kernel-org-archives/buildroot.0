From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 11:31:17 +0100
Subject: [Buildroot] [PATCH] boost: add patch to fix test of FPE support
In-Reply-To: <20170311203337.31569-1-joerg.krause@embedded.rocks>
References: <20170311203337.31569-1-joerg.krause@embedded.rocks>
Message-ID: <20170312113117.6532fae5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Mar 2017 21:33:37 +0100, J?rg Krause wrote:
> We recently bumped boost from version 1.61.0 to 1.63.0.
> 
> Upstream has updated the handling of FPE support in 1.63.0 resulting in build
> errors for some architectures, like SH4 and OpenRISC, which were build
> successfully with 1.61.0.

Sorry, I'm only seeing this patch now. I reverted the 1.63.0 bump of
Boost just a few minutes ago.

So, could you cook a new patch that bumps boost, test it with the
test-pkg utility (with all boost sub-options enabled), and if it
succeeds, submit it?

Thanks a lot for your work. Bumping boost has never been very easy :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
