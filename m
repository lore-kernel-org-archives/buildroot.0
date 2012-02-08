From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 17:18:51 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB57ED00.2EC7%donald.poole@swri.org> (Donald R. Poole's message
 of "Wed, 8 Feb 2012 15:20:20 +0000")
References: <CB57ED00.2EC7%donald.poole@swri.org>
Message-ID: <87mx8t8fis.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

Hi,

 >> I don't see "Login incorrect" anywhere in that log. Did you remember to
 >> use strace -f ?

 Donald> I did use strace -f.  These are the steps I took.  I keep my
 Donald> inittab the same (left ttymxc0::respawn:/sbin/getty -n -L
 Donald> ttymxc0 115200 vt100 -n -l /bin/sh # GENERIC_SERIAL) so I could
 Donald> login without login prompt.  Then I executed this strace
 Donald> command:

 Donald> 	strace -o strace.out -f /bin/login

 Donald> Then I copied the contents of strace.out to the mailing list.
 Donald> I actually had to force a reboot of the system because the
 Donald> strace never terminated because it was hung up somewhere and
 Donald> kept printing out this over and over in the strace.out file:

Ok, but what happened to the "Login incorrect" line? Do you still get
that printed to the serial port?

-- 
Bye, Peter Korsgaard
