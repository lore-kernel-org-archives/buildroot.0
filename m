From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2009 01:31:16 +0200
Subject: [Buildroot] Qtopia4 build issue
In-Reply-To: <874ox98ijk.fsf@macbook.be.48ers.dk>
References: <20090226122205.390e848a@surf> <20090226162124.2d78cfa4@surf>
	<20090227152717.5cefcd92@surf> <874ox98ijk.fsf@macbook.be.48ers.dk>
Message-ID: <20090401013116.1b9ba88c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le Tue, 31 Mar 2009 23:54:39 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Is this still needed? I don't normally use QT, but built it earlier
> today without problems (after the fixes I committed today).

I worked on Qt build issues on Sunday, but didn't had the time to reach
a submitable state before the end of day. Definitely, on Sunday, quite
a few modifications were needed to get Qtopia4 to build properly (with
an external toolchain, or on a x86). But I suspect that your recent
changes fix at least part of these issues. I'll have a try at them
soonish and I'll let you know.

Thanks for the improvements!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
