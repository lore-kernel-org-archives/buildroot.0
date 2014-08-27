From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 27 Aug 2014 21:32:49 +0200
Subject: [Buildroot] [PATCH] uboot-tools: add patch to fix (no)stripping
	on non-ELF platforms
In-Reply-To: <1409143088-25294-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 27 Aug 2014 14:38:08 +0200")
References: <1409143088-25294-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ioldu3ry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > On Blackfin FLAT, stripping does not exist, but recent U-Boot versions
 > nonetheless try to strip and fail if they cannot do so. This commit
 > adds a U-Boot patch (submitted upstream) that solves this issue.

 > Fixes:

 >   http://autobuild.buildroot.org/results/153/1530f8247d1652da5779994f298141b1572ce74f/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
