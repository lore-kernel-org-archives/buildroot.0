From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Jun 2008 20:36:11 +0200
Subject: [Buildroot] FW:  Problem: Unable to select packages
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19091D7455@mi8nycmail19.Mi8.com>
	(hartleys@visionengravers.com's message of "Tue\,
	24 Jun 2008 11\:59\:43 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE19091D7455@mi8nycmail19.Mi8.com>
Message-ID: <87fxr2u1d0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "hartleys" == hartleys  <hartleys@visionengravers.com> writes:

Hi,

 hartleys> Hello all,
 hartleys> This problem still exists with svn 22489.

 hartleys> Trying to select any package in the "Graphics libraries and
 hartleys> applications (grpahic/text) -->" sub-menu just moves the
 hartleys> selection to "*** --> (May be broken in busybox) ***"

It seems like kconfig doesn't like () in comments. Fixed in r22492 -
Thanks!

-- 
Bye, Peter Korsgaard
