From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Jun 2009 10:35:37 +0200
Subject: [Buildroot] Build instructions for ARM big-endian BE-8 target
In-Reply-To: <56ea0bb80906050103x4c49cd28o3a2246499985162b@mail.gmail.com>
	(Paul Archer's message of "Fri\, 5 Jun 2009 18\:03\:12 +1000")
References: <645850.50696.qm@web42108.mail.mud.yahoo.com>
	<871vpzywbm.fsf@macbook.be.48ers.dk>
	<56ea0bb80906050103x4c49cd28o3a2246499985162b@mail.gmail.com>
Message-ID: <87skifxeli.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Archer <ptarcher@gmail.com> writes:

 Paul> I guess
 Paul> BE-8 = Big Endian 8 bit instructions
 Paul> BE-32 = Big Endian 32 bit instructions...

That doesn't make much sense. ARM instructions are 32bit (except for
thumb) and you cannot talk about endianess on byte values.

-- 
Bye, Peter Korsgaard
