From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:25:04 +0100
Subject: [Buildroot] [PATCH] wine: Drop glibc requirement
In-Reply-To: <1520590842-3879-1-git-send-email-nerv@dawncrow.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Hentschel"'s message of "Fri, 9 Mar 2018 11:20:42 +0100")
References: <1520590842-3879-1-git-send-email-nerv@dawncrow.de>
Message-ID: <87vae25mq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

 > I noticed it's not needed anymore, musl went upstream at some point and uClibc is now build with bessel functions:
 > https://git.buildroot.net/buildroot/commit/package/uclibc?id=de56d58e5d26d78161ca3b7a1a2a4decfe4e89db

 > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Committed, thanks.

Have you verified that E.G. a static only uClibc configuration works?
test-pkg is handy for such checks.

-- 
Bye, Peter Korsgaard
