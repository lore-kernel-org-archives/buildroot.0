From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 11:05:52 +0200
Subject: [Buildroot] [PATCH 4/9] docs/manual: document gcc version
 dependencies
In-Reply-To: <20150804195858.GW3647@free.fr>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804195858.GW3647@free.fr>
Message-ID: <20150805110552.1846c7bf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 4 Aug 2015 21:58:58 +0200, Yann E. MORIN wrote:

> > +* GCC version
> > +** Dependency symbol: +BR2_TOOLCHAIN_GCC_AT_LEAST_X_Y+, (replace
> > +   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> > +** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace
> 
> One of the condition is between ++ and the other between ``. I konow you
> just replicated what was done for the kernel headers, but wuld it not be
> better to use only ++ (or only ``, I don't mind) but not both?

There is actually a good reason for that: if you use +...+ for +gcc <=
X.Y+, then the <= gets replaced by the <= mathematic character rather
than being the two characters < and =.

So I've kept the special use of `...` for the time being.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
