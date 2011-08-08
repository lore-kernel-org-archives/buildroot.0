From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Aug 2011 21:43:32 +0200
Subject: [Buildroot] Problems with udev buildroot
In-Reply-To: <20110808191827.101280@gmx.net> (Heiko Helmle's message of "Mon, 
 08 Aug 2011 21:18:27 +0200")
References: <20110808191827.101280@gmx.net>
Message-ID: <87ty9rk7tn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Helmle <helman@gmx.net> writes:

 Heiko> Hello
 Heiko> Hit the send button too early :)

 Heiko> it seems like /dev/null is missing and the generated image isn't able to mount anything...

Do you have CONFIG_DEVTMPFS_MOUNT enabled in the kernel? If so, that
should take care of /dev/null.

-- 
Bye, Peter Korsgaard
