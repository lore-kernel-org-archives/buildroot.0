From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 20 Sep 2007 12:52:42 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <18114.192.168.2.100.1190279179.squirrel@home.the-hug.net>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
	<46EEEEE2.7060705@free.fr> <20070919064200.GA29317@zelow.no>
	<20070919192740.GC817@aon.at> <20070919205603.GA16408@zelow.no>
	<18114.192.168.2.100.1190279179.squirrel@home.the-hug.net>
Message-ID: <20070920105242.GB17954@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 10:06:19AM +0100, Elizabeth Oldham wrote:
> 
> Ummm, what about both, would that be too intrusive? In a project I'm
> looking at doing being able to select an individual package or all in the
> build and have ipkg capability, would be very useful.

There used to be an ALLYESCONFIG in the kernel and also Busybox if I
remember correctly but both seems to be history.

We could add "ALLPACKAGES" (or something) somewhere wich would just set 
all packages which has tristate, to "m".

But you'd like to be able to choose what to compile and then choose
between base or module? well, that's just as easy to do when you are
choosing anyway. or have I misunderstood something?


Thomas.
