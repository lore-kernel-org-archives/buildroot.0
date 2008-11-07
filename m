From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 07 Nov 2008 09:58:15 +0100
Subject: [Buildroot] [PATCH] Make the MESSAGE Macro work
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909C91CCD@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Wed\,
	5 Nov 2008 12\:16\:02 -0500")
References: <BD79186B4FD85F4B8E60E381CAEE1909C91CCD@mi8nycmail19.Mi8.com>
Message-ID: <87ej1ngbfc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

 hartleys> Hello all,
 hartleys> The following patch makes the MESSAGE Macro in Makefile.autotools.in
 hartleys> work.

 hartleys> I think it was originally intended to print the messages in bold type
 hartleys> but it doesn't appear to work correctly. This patch should work on all

Thanks, committed (with :=) as r23955.

-- 
Bye, Peter Korsgaard
