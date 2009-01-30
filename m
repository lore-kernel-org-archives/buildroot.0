From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Fri, 30 Jan 2009 18:57:16 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: 0 dbus libxml2
In-Reply-To: <87vdrxnoei.fsf@macbook.be.48ers.dk>
References: <20090130074016.0A323765E9@busybox.osuosl.org>
	<C13DBBE85AD6974B85C118C35890CA5F1AF39BE4AC@EU1RDCRDC1WX029.exi.nxp.com>
	<1233306201.4147.79.camel@elrond.atmel.com>
	<87vdrxnoei.fsf@macbook.be.48ers.dk>
Message-ID: <1233338236.4147.96.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre 2009-01-30 klockan 10:17 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> Wihtout the fix, libxml2 is not built before dbus,
>  Ulf> and a solution which continuously rebuilds libxml2
>  Ulf> is also undesirable.
> 
>  Ulf> ?With this fix dbus builds, but feel free to work on it.
> 
> That's not how things work. You address the comments or revert the commit.
> 

Just a time issue.
I had to leave for some other things at that point.
It has been updated by now, I see.

BR
Ulf Samuelsson
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
