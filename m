From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 02 Jan 2009 23:20:31 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain:
	export-toolchain uClibc
In-Reply-To: <184FF361662E479582AF4706B539C4E5@aeglos> (Ulf Samuelsson's
	message of "Fri\, 2 Jan 2009 22\:52\:15 +0100")
References: <20081221171134.7BAB176ABE@busybox.osuosl.org>
	<87fxkf6vdl.fsf@macbook.be.48ers.dk>
	<87iqox1m2d.fsf@macbook.be.48ers.dk>
	<184FF361662E479582AF4706B539C4E5@aeglos>
Message-ID: <87eizl1hao.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 ulf> Author: ulf
 ulf> Date: 2008-12-21 17:11:33 +0000 (Sun, 21 Dec 2008)
 ulf> New Revision: 24480
 >> 
 ulf> Log:
 ulf> Allow creating a script for external use of Buildroot toolchain
 >> 
 >> It's been 10 days now, and it has been disabled in Kconfig since then,
 >> so I'll revert the commit.

 Ulf> Why disable it?
 Ulf> I find this pretty useful.

Because it broke the build, see the mail I sent on the 23th + svn.

-- 
Bye, Peter Korsgaard
