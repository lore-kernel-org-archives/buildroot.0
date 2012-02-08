From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Feb 2012 17:34:29 +0100
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <CB57FCFF.2EDB%donald.poole@swri.org> (Donald R. Poole's message
 of "Wed, 8 Feb 2012 16:25:38 +0000")
References: <CB57FCFF.2EDB%donald.poole@swri.org>
Message-ID: <87fwel8esq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:

Hi,

 >> Ok, but what happened to the "Login incorrect" line? Do you still get
 >> that printed to the serial port?

 Donald> No, that never was printed to the serial port.  After executing
 Donald> the strace command, it hung and kept printing out:

 Donald> 	1292  ioctl(0, SNDCTL_TMR_CONTINUE or TCSETSF, {B115200 opost isig icanon
 Donald> 	echo ...}) = ? ERESTARTSYS (To be restarted)
 Donald> 	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---
 Donald> 	1292  --- SIGTTOU (Stopped (tty output)) @ 0 (0) ---

But in your original email you told us that you were getting that
error. What changed?

-- 
Bye, Peter Korsgaard
