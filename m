From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:40:54 +0100
Subject: [Buildroot] [PATCH 06/22] gcc: introduce BR2_GCC_NEEDS_MPC to
	reduce code duplication
In-Reply-To: <1364113606-20836-7-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:30 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874ng1nf6x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> For each version of gcc, we need to check whether it requires mpc as a
 Thomas> dependency. Since this is true for 4.5, 4.6, 4.7, snapshots and now
 Thomas> 4.8, let's factorize this code a bit by using a Kconfig symbol that
 Thomas> tells us whether we are using a gcc version that requires mpc.

Committed, thanks.

-- 
Bye, Peter Korsgaard
