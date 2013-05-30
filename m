From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 May 2013 21:51:04 +0200
Subject: [Buildroot] [PATCH 3/6] binutils: apply post-patch hook on both
	the host and target builds
In-Reply-To: <1369695664-5670-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 28 May 2013 01:01:01 +0200")
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87hahkz1p3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When a Xtensa specific patch needs to be applied, it should be applied
 Thomas> both when doing the target and the host build.

 Thomas> This change is part of the effort to remove the differences between
 Thomas> host and target post-extract and post-patch hooks, that are
 Thomas> problematic for the out-of-tree support.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
