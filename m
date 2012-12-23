From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Dec 2012 19:08:04 +0100
Subject: [Buildroot] [PATCH] toolchain-external: re-introduce Sourcery
	CodeBench ARM 2010.09
In-Reply-To: <1356270120-20416-1-git-send-email-plagnioj@jcrosoft.com>
 (Jean-Christophe PLAGNIOL-VILLARD's message of "Sun, 23 Dec 2012
 14:42:00 +0100")
References: <1356270120-20416-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <8738ywtzej.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

 J> on the lastest release the toolchain can not produce a working rootfs for
 J> at91rm9200

 J> Tested on at91rm9200ek

 J> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
 J> ---
 J> Hi,

 J> 	I try the internal toolchains of buildroot we have the same issue

Interesting. How did you configure it? I've used BR on the mini2440
(s3c2440), which is also arm920t recently without problems.

-- 
Bye, Peter Korsgaard
