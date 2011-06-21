From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 22 Jun 2011 00:21:39 +0200
Subject: [Buildroot] [PATCH v3] ext-toolchain-wrapper.c: Handle an
	arbitrary amount of arguments
In-Reply-To: <1308686067-6091-1-git-send-email-daniel.nystrom@timeterminal.se>
 ("Daniel =?utf-8?Q?Nystr=C3=B6m=22's?= message of "Tue, 21 Jun 2011
 21:54:27 +0200")
References: <1308686067-6091-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <874o3iddvw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Nystr?m <daniel.nystrom@timeterminal.se> writes:

 Daniel> Even though MAXARGS 1000 seems large, it wasn't enought for at least
 Daniel> QtWebKit package. This new version does not have any predefined limits.

 Daniel> Closes #3907

 Daniel> Many thanks to Thomas for tracing the source of the build error.

 Daniel> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
 Daniel> Reported-by: Thomas Bj?rk <thomas.bjork@home.se>

Committed, thanks!

-- 
Bye, Peter Korsgaard
