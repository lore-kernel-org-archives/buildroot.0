From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 10:17:41 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package: 0 dbus libxml2
In-Reply-To: <1233306201.4147.79.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Fri\, 30 Jan 2009 10\:03\:21 +0100")
References: <20090130074016.0A323765E9@busybox.osuosl.org>
	<C13DBBE85AD6974B85C118C35890CA5F1AF39BE4AC@EU1RDCRDC1WX029.exi.nxp.com>
	<1233306201.4147.79.camel@elrond.atmel.com>
Message-ID: <87vdrxnoei.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> Wihtout the fix, libxml2 is not built before dbus,
 Ulf> and a solution which continuously rebuilds libxml2
 Ulf> is also undesirable.

 Ulf> ?With this fix dbus builds, but feel free to work on it.

That's not how things work. You address the comments or revert the commit.

-- 
Bye, Peter Korsgaard
