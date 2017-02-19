From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 22:45:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpv: fixup fix build on
	powerpc64 w/ altivec
In-Reply-To: <51f5a34879535401d9769f0aa92fe5b3959784c2.1482103876.git.sam.bobroff@au1.ibm.com>
 (Sam Bobroff's message of "Mon, 19 Dec 2016 10:31:17 +1100")
References: <51f5a34879535401d9769f0aa92fe5b3959784c2.1482103876.git.sam.bobroff@au1.ibm.com>
Message-ID: <877f4lsvm2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sam" == Sam Bobroff <sam.bobroff@au1.ibm.com> writes:

 > The initial fix for this issue, re-including stdbool.h, is not
 > working.

 > Instead, fix using the method used for other packages with a similar
 > problem: add -std=gnu99, which prevents bool from being redefined and
 > removes the need for any source code change.

 > Fixes: 64904f0f6d691cfea5ae1c8f58e2d61aac0684c2

 > Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
