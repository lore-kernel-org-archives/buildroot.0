From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 22:00:39 +0200
Subject: [Buildroot] Open question: remove "toolchain on target" option
In-Reply-To: <201208111446.58278.minimod@morethan.org>
References: <20120811202114.3a95d4ab@skate>
 <201208111446.58278.minimod@morethan.org>
Message-ID: <20120811220039.0547c8f1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

Le Sat, 11 Aug 2012 14:46:53 -0500,
"Michael S. Zick" <minimod@morethan.org> a ?crit :

> On Sat August 11 2012, Thomas Petazzoni wrote:
> > ?(3) None of the core Buildroot developers seem to care about this,
> > ? ? ?no-one is apparently using/fixing this mechanism.
> 
> The only reason I can see in the argument against continuing support.
> 
> A target native toolchain is one of the most often required set of
> applications in the after-market embedded world.

What do you call the "after-market embedded world"? Do you mean the
usage of consumer electronic devices for things that go beyond their
original purposes, by hobbyists? If it's the case, then I think we
definitely want to support this use case, but I don't see how this use
case requires a toolchain on the target.

Could you expand a bit on what this use case is, and how it requires
having a toolchain on the target?

Somehow, your e-mail seems to convey some sort of frustration about
Buildroot and/or its developers. What are the problems you are having?
I am really interested in understanding for what reasons Buildroot is
making people unhappy, and see if there are ways to improve that.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
