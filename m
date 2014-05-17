From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 May 2014 23:26:04 +0200
Subject: [Buildroot] [PATCH 1/2] zyre: propagate missing BR2_USE_MMU
	dependency
In-Reply-To: <1400335344-8531-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 17 May 2014 16:02:23 +0200")
References: <1400335344-8531-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <877g5knllf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > zyre selects filemq, and filemq 'depends on BR2_USE_MMU', but this
 > dependency was not propagated to zyre. This commit fixes that.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
