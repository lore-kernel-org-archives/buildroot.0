From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Oct 2013 08:58:27 +0200
Subject: [Buildroot] [PATCH] Revert "toolchain-internal: skip
	gcc-intermediate when possible"
In-Reply-To: <1380825301-1079-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 3 Oct 2013 20:35:01 +0200")
References: <1380825301-1079-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87pprlldyk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> While the idea of skipping the intermediate gcc step seems to work
 Thomas> fine in most situations, it causes problems with the SSP
 Thomas> support. Until we can figure out a proper solution for this problem,
 Thomas> we need to revert back to the previous solution of a three stages
 Thomas> build.

 Thomas> This reverts commit 2babed4a50fcd050abc4686e05e24d0e374d10a8.

Committed, thanks.

-- 
Bye, Peter Korsgaard
