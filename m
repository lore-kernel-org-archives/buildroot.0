From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 22:38:01 +0200
Subject: [Buildroot] [PATCH 6/8] toolchain: add inotify_init1 syscall
	support to uclibc 0.9.31
In-Reply-To: <1302712169-28385-6-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 13 Apr 2011 13:29:27 -0300")
References: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
	<1302712169-28385-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8739l43g0m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add inotify_init1 system call support to uclibc 0.9.31.
 Gustavo> Required for modern versions of udev.

Committed, thanks.

-- 
Bye, Peter Korsgaard
