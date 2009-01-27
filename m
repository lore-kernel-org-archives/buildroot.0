From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 08:08:53 +0100
Subject: [Buildroot] Newbie question
In-Reply-To: <20090127073152.0571b3ae@hcegtvedt> (Hans-Christian Egtvedt's
	message of "Tue\, 27 Jan 2009 07\:31\:52 +0100")
References: <497EA507.6060505@iwtech.com.au>
	<20090127073152.0571b3ae@hcegtvedt>
Message-ID: <877i4h2pkq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 Hans-Christian> It is set for some targets in a Makefile in a sub
 Hans-Christian> directory beneath target/devices/...

 Hans-Christian> Perhaps doing make BOARD_NAME=foobar works

It seems like we have a BR2_BOARD_NAME several places under
target/device. That should probably be generalized and moved together
with BR2_PROJECT.

-- 
Bye, Peter Korsgaard
