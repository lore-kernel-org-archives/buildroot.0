From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 22:10:14 +0200
Subject: [Buildroot] [PATCH 20/20] support/testing: add runtime testing
 for init systems
In-Reply-To: <26a88450-f1cb-a870-136a-936f0e5c9ec7@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <95f6965c48dbf2f754818e2bec1f2d3891015475.1500398733.git.yann.morin.1998@free.fr>
 <e1b95878-e58f-c884-4265-8a1dcae14583@mind.be>
 <20170722144552.GE9929@scaer>
 <26a88450-f1cb-a870-136a-936f0e5c9ec7@mind.be>
Message-ID: <20170722221014.672f9eb2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Jul 2017 21:53:38 +0200, Arnout Vandecappelle wrote:

> > OTOH, ahving the tests in right now would be quite an incentive to get
> > the rest in. ;-]  
> 
>  Well, we already have two tests failing and nobody seems to fix them...

The patches fixing them are here:

  http://patchwork.ozlabs.org/patch/783135/
  http://patchwork.ozlabs.org/patch/783137/
  http://patchwork.ozlabs.org/patch/783136/

and nobody reviews them.

(Actually only the first patch of the series is needed to fix the
tests)

I made those on July 1st, pretty much the day we started running the
tests in Gitlab CI. So it's a bit hard to now read your complaint that
nobody cares about the failing tests...

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
