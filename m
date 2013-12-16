From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 22:12:12 +0100
Subject: [Buildroot] [PATCH v2] arm: mx5: Add fuse supply enable in
	fsl_iim
In-Reply-To: <1387211106-28975-1-git-send-email-alyoshin.s@gmail.com> (Sergey
 Alyoshin's message of "Mon, 16 Dec 2013 20:25:06 +0400")
References: <1387211106-28975-1-git-send-email-alyoshin.s@gmail.com>
Message-ID: <87bo0gqz4j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Alyoshin <alyoshin.s@gmail.com> writes:

 > Enable fuse supply before fuse programming and disable after.
 > Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
 > Tested-by: Sergey Alyoshin <alyoshin.s@gmail.com>

 > Tested on i.MX53 custom board by writing MAC addresses in fuse bank 1.

Ehh, did you mean to send this to the ARM kernel list instead?

-- 
Bye, Peter Korsgaard
