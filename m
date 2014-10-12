From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 19:23:50 +0200
Subject: [Buildroot] [PATCH] wpa_supplicant: uses fork(),
	not available on no-MMU platforms
In-Reply-To: <1413131995-28658-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Oct 2014 18:39:55 +0200")
References: <1413131995-28658-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k345td5l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The only package selecting wpa_supplicant is connman, and it is
 > already depends on BR2_USE_MMU.

 > Fixes:

 >   http://autobuild.buildroot.org/results/9ac/9ac3c0de573f5266a889f1ceb6d43aa92f715c55/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
