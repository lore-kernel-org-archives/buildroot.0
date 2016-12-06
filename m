From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 11:29:07 +0100
Subject: [Buildroot] [PATCH] sysklogd: fix build on musl
In-Reply-To: <1480371658-31317-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 28 Nov 2016 23:20:58 +0100")
References: <1480371658-31317-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8760mx5p1o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This commit add a stack of small patches that make sysklogd build fine
 > with the musl C library. Build with uClibc and glibc has been tested
 > with those patches applied as well.

 > The first patch is slightly rework (better description and capital
 > letter to the title) in preparation for upstream submission.

 > Fixes:

 >   http://autobuild.buildroot.net/results/8fa2bf73f983330884bce2e5ac31e01dee112ba9/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
