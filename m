From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 16:18:15 +0200
Subject: [Buildroot] [PATCH] docs/manual: remove example comment causing
	issues
In-Reply-To: <1413120085-21063-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Oct 2014 15:21:25 +0200")
References: <1413120085-21063-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87bnphxtg8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The manual gives this example for using the github macro:
 >   FOO_VERSION = v1.0 # tag or full commit ID

 > Unfortunately, people copy/pasting this example will face weird make
 > errors, because it leads the FOO_VERSION variable to end with a
 > space. Since the manual is anyway explaining just below the example
 > that FOO_VERSION can be used either with a tag or a full commit ID,
 > the simplest solution is to simply remove this comment.

 > Reported-by: Edd Robbins <edd.robbins@gmail.com>
 > Cc: Edd Robbins <edd.robbins@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks, but I'll rather just fix the issue instead as people can very
easily end up with something like this when E.G. testing a version bump.

-- 
Bye, Peter Korsgaard
