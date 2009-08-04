From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2009 21:39:50 +0200
Subject: [Buildroot] Problem using netsnmp
In-Reply-To: <4A785AE1.8010609@tandberg.com>
References: <4A6EE8F1.3060302@tandberg.com> <20090804162948.255a47df@surf>
	<4A785AE1.8010609@tandberg.com>
Message-ID: <20090804213950.29a1cc76@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

[ I'm re-adding the Buildroot list in Cc: ]

Le Tue, 04 Aug 2009 16:59:29 +0100,
Chris Smith <chris.smith@tandberg.com> a ?crit :

> I tested the patch. Seems to work ok.

Thanks for testing the patch!

>  I had some issues with building in parallel,  I have set 4 as the
> Number of jobs to run simultaneously. I had to try and build a few
> times before it worked. Just dependency issues I think.

I didn't try with a number of jobs > 1, and before my patch, netsnmp
was forced to make -j1 even if a number of jobs > 1 was selected
globally in Buildroot.

I will try to provide another fix for this issue.

> > Moreover, I've added a few things in the TODO about netsnmp (see
> > http://git.buildroot.net/~tpetazzoni/git/buildroot/patch/?id=d7890dd09302bc912cca13d65aa128eb826f9123).
> > If you're interested in helping for one of them (like telling us how
> > netsnmp should be packaged, what are the different programs,
> > libraries and configuration files useful for), don't hesitate!

Any suggestions about this ?

Thanks again for the report and the test,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
