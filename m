From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 May 2014 00:03:37 +0200
Subject: [Buildroot] [PATCH] aiccu: not available on NIOS II
In-Reply-To: <1399932050-11947-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 13 May 2014 00:00:50 +0200")
References: <1399932050-11947-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <878uq6wt6u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Building aiccu does not work on NIOS II due to the _gp problem, and
 > nobody is interested to fix it for now, so we simply disallow this
 > package. While we're at it, we propagate the AVR32 exclusion to the
 > comment.

 > Fixes:

 >   http://autobuild.buildroot.net/results/786/7864cd5789a9f9b9f0603d738f4e63822d8469dd/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
