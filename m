From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 09:53:01 +0100
Subject: [Buildroot] [PATCH] libpfm4: needs thread support
In-Reply-To: <1386098838-26777-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 3 Dec 2013 20:27:18 +0100")
References: <1386098838-26777-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87iov5m1zm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Fixes:
 >   http://autobuild.buildroot.net/results/73d736dd3c8a70358ef4b19a63dda46178cf8bf1/

 > Note that the propagation of the thread dependency to the oprofile
 > package is a little bit non standard, because oprofile selects libpfm4
 > only on the PowerPC architecture. So we ensure the thread dependency
 > is only enforced on PowerPC, and a separate comment is displayed when
 > thread support is not available, but the PowerPC architecture is used.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
