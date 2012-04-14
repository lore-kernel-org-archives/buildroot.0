From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 14 Apr 2012 23:03:47 +0200
Subject: [Buildroot] [PATCH] toolchain/uClibc: fix default configs with
	respect to bug #5018
In-Reply-To: <1334240080-27421-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 12 Apr 2012 11:14:40 -0300")
References: <1334240080-27421-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r4vqc9fw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Switch from the strict UCLIBC_HAS_CTYPE_ENFORCED=y to the less
 Gustavo> restrictive UCLIBC_HAS_CTYPE_CHECKED=y since it breaks dialog under
 Gustavo> certain circumstances (bug #5018).

Committed, thanks.

-- 
Bye, Peter Korsgaard
