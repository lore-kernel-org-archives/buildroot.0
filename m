From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Jul 2009 22:45:16 +0200
Subject: [Buildroot] Write Access to buildroot?
In-Reply-To: <4A69D04E.9040408@atmel.com>
References: <4A689265.6030308@atmel.com> <87skgmwm6h.fsf@macbook.be.48ers.dk>
	<4A69741A.8010903@atmel.com>
	<20090724085603.GL13236@buzzloop.caiaq.de>
	<9E543F22BF68405185D6B77291E4E5EF@aeglos>
	<20090724121641.2c4cf8bd@surf> <4A699CDD.7060703@atmel.com>
	<20090724152448.4d1f5934@surf> <4A69D04E.9040408@atmel.com>
Message-ID: <20090724224516.15b39e30@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 24 Jul 2009 17:16:30 +0200,
Ulf Samuelsson <ulf.samuelsson@atmel.com> a ?crit :

> And what I am missing, is a way to have several people commit to the
> same tree.
> I.E: A development tree.

This is not how development works with Git. Everyone works in its
own working tree, and asks the project maintainer to pull the working
tree when things are ready. Things gets integrated in the project
maintainer tree, which everyone can update from to get the changes from
the other developers.

In Buildroot, there's no ? development tree ? in the current
development model. The same tree (the official way) is sometimes a
development tree (before -rc1 is released), sometimes a stabilization
tree (between the release of -rc1 and the release of the stable
version).

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
