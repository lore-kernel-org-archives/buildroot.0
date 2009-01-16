From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 16 Jan 2009 21:46:06 +0100
Subject: [Buildroot] libglibg2 fails
In-Reply-To: <20090116110758.GA30811@zelow.no>
References: <1232091382.8094.40.camel@aeglos.sweden.atmel.com>
	<87iqof7hzd.fsf@macbook.be.48ers.dk>
	<1232098950.7129.1.camel@aeglos.sweden.atmel.com>
	<20090116110758.GA30811@zelow.no>
Message-ID: <1232138766.6977.5.camel@aeglos.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-16 klockan 12:07 +0100 skrev Thomas Lundquist:
> On Fri, Jan 16, 2009 at 10:42:30AM +0100, Ulf Samuelsson wrote:
> > 
> > I think it is a dependency that is missing.
> > Would appreciate it, if anyone with a working libglib2 for arm,
> > could post the .config to the list
> 
> I wouldn't be too surprised if this was my fault. I'll fix it
> this week end.

Not neccessarily, since I am not doing a regular make.
I want to be able to test as many packages as possible,
and run the mkpkg script on each package, without
the package neccessarily beeing enabled in .config.

By running mkpkg on each package, I get an overview
of what builds and what does not, allowing easy fixes
but also this process is not stable yet.

BR
Ulf Samuelsson


> 
> 
> Thomas.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
