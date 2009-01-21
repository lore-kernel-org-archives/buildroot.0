From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 21 Jan 2009 12:38:41 +0100
Subject: [Buildroot] List of working packages for ARM
In-Reply-To: <1232526975.6326.6.camel@sven>
References: <1232523725.11888.11.camel@elrond.atmel.com>
	<1232526975.6326.6.camel@sven>
Message-ID: <1232537921.11888.13.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-21 klockan 09:36 +0100 skrev Sven Neumann:
> Hi,
> 
> On Wed, 2009-01-21 at 08:42 +0100, Ulf Samuelsson wrote:
> > Using gcc-4.2.4, bu-2.18, uclibc-0.9.30
> > wchar, largefile,ipv6, NWFPE
> 
> We are building for ARM as well, using gcc 4.3.2, uclibc-0.9.30, wchar,
> largefile, !ipv6. 

Can you send your ".config" to my email address?

Since I am not running a straight "make" (using scripts/buildall.sh),
this can cause some extra problems.

BR
Ulf Samuelsson

> 
> > Some key packages that I do not get to build are
> 
> > alsa-utils          "Depends on alsa-lib"
> 
> alsa-lib builds for me. Yesterday we updated to version 1.0.19, the
> latest stable release, and that version also compiles nicely. Perhaps
> you might want to try that update in buildroot?
> 
> 
> Sven
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
