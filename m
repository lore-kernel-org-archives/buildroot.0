From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 15:17:34 +0100
Subject: [Buildroot] [PATCH v3 1/2] randconfig,
 allyesconfig: fix handling of legacy options
In-Reply-To: <20141030230310.4b91e6ab@free-electrons.com>
References: <1413278695-8979-1-git-send-email-arnout@mind.be>
 <20141030230310.4b91e6ab@free-electrons.com>
Message-ID: <20141231151734.0c95b119@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Oct 2014 23:03:10 +0100, Thomas Petazzoni wrote:

> I was going to apply this, and then I tested it, to discover that it
> then causes the same problem as the one we have with randpackageconfig
> today: none of the choice options get randomized anymore. So before
> this patch, if you do "randconfig", you get proper randomization. After
> this patch, if you do "randconfig", it only generates i386
> configurations.
> 
> I admit it's not really an issue introduced by the patch as the issue
> already exists for randpackageconfig. But it's very annoying :/

Any comment about this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
