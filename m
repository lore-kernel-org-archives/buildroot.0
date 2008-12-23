From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Dec 2008 12:07:58 +0100
Subject: [Buildroot] Unable to 'make' with svn revision 24492
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909F3E892@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Mon\,
	22 Dec 2008 11\:30\:41 -0500")
References: <BD79186B4FD85F4B8E60E381CAEE1909F3E892@mi8nycmail19.Mi8.com>
Message-ID: <87ocz35eup.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> make: *** No rule to make target `cross_compiler', needed by
 hartleys> `/home/bigguiness/arm-uclibc-gcc-.sh'.  Stop.

 hartleys> I am using an external binary toolchain and everything has worked fine
 hartleys> up until the latest revision.

 hartleys> Any idea? Thanks,
 hartleys> Hartley

I fixed a build issue in r24519 - Maybe that solves it for you?

-- 
Bye, Peter Korsgaard
