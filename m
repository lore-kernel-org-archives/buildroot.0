From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Aug 2013 00:00:25 +0200
Subject: [Buildroot] [PATCH] kmod: fix build failure on gcc < 4.6 caused
	by _Static_assert()
In-Reply-To: <1377706232-26988-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 28 Aug 2013 18:10:32 +0200")
References: <1377706232-26988-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87d2oxh3wm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit introduces a patch to kmod that ensures _Static_assert()
 Thomas> is only used if available. The patch has been submitted upstream.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.net/results/9daf0f46642020591731e20d3bf9041ff6259846/

Committed, thanks.

-- 
Bye, Peter Korsgaard
