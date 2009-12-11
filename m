From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Dec 2009 12:16:54 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Fri,
	11 Dec 2009 11:36:28 +0100")
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
Message-ID: <874onxvjyx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

Hi,

 Bj?rn> I'm on Ubuntu 9.10 Karmic amd64. I just tried BR on another
 Bj?rn> machine (also Karmic amd64) and the same thing happens there. I
 Bj?rn> also tried to symlink /bin/sh to /bin/dash on one of the
 Bj?rn> machines. It didn't help.

Strange. Do you only see this with avr32 builds or also a build for
E.G. i386? What does make --version give you?

-- 
Bye, Peter Korsgaard
