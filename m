From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 08:01:03 +0200
Subject: [Buildroot] [RFC PATCH 2/4] support/testing: allow to use extra
 large timeouts
In-Reply-To: <597fbcffa7937_423beb827892640@ultri3.mail>
References: <20170731212504.7f4ebf3b@windsurf.home>
 <597fbcffa7937_423beb827892640@ultri3.mail>
Message-ID: <20170801080103.7273fafc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Jul 2017 20:27:59 -0300, Ricardo Martincoski wrote:

> > Perhaps we should call this --timeout-multiplier or something like
> > that ?  
> 
> Sure. I will fix and resend.
> I will use -m as short name because -t is already in use.

Or perhaps this option is "specialized" enough that it doesn't need a
short name, so that we avoid "polluting" the namespace of short names,
which as you've seen, already has some collisions :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
