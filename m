From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 14 Jan 2011 23:08:49 +0100
Subject: [Buildroot] [PATCH] kexec: bump to version 2.0.2 + change URL
	to match kernel.org
In-Reply-To: <4D30C5BF.6050106@AdTran.com> (Andy Kennedy's message of "Fri, 14
	Jan 2011 15:53:03 -0600")
References: <4D30C5BF.6050106@AdTran.com>
Message-ID: <87vd1r6sum.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andy" == Andy Kennedy <Andy.Kennedy@adtran.com> writes:

 Andy> Okay, this is like TAKE-6 or so. . . Hopefully, there will be no egg
 Andy> in my face this time. ;)

Wee, it worked! One minor nit: This kind of extra info that shouldn't be
part of the commit message should go under the '---' line, so git-am
doesn't include it in the commit.

Committed, thanks!

 Andy> Changed the KEXEC_SITE to the new home of kexec.  This patch also
 Andy> satisfies bug id=3007 created by me last month.  Thanks to Gustavo for
 Andy> pointing out that the easy fix was to bump kexec to 2.0.2.

 Andy> Signed-of-by: Andy Kennedy <Andy.Kennedy@AdTran.com>

-- 
Bye, Peter Korsgaard
