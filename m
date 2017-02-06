From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Feb 2017 22:57:22 +0100
Subject: [Buildroot] [PATCH] binutils: backport fix for
	xg_reverse_shift_count
In-Reply-To: <1486409704-16096-1-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Mon, 6 Feb 2017 11:35:04 -0800")
References: <1486409704-16096-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87efzbugn1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > binutils-2.27 gas has bug that results in the following kind of build
 > error when assembling bb[cs]i.l on big-endian xtensa targets:

 >   ieee754-sf.S:237: Error: invalid symbolic operand

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
