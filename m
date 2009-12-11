From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Dec 2009 12:18:18 +0100
Subject: [Buildroot] *Tons* of BR warnings like
 "package/Makefile.autotools.in:179: warning: overriding commands for target
 `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
Message-ID: <20091211121818.675a61bf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 11 Dec 2009 11:36:28 +0100,
Bj?rn Forsman <bjorn.forsman@gmail.com> a ?crit :

> I'm on Ubuntu 9.10 Karmic amd64. I just tried BR on another machine
> (also Karmic amd64) and the same thing happens there. I also tried to
> symlink /bin/sh to /bin/dash on one of the machines. It didn't help.

I cannot reproduce here. My buildroot version (from git) works well on
a Karmic x86.

Which version of Buildroot are you using exactly ? Which version of
make does your system has ? Do you have any BUILDROOT_* environment
variable set ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
