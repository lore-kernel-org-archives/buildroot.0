From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:47:09 +0100
Subject: [Buildroot] [PATCH 12/22] iproute2: add dependency on host-bison
In-Reply-To: <1364113606-20836-13-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:36 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehf5m0c2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> iproute2 requires bison, so we add the necessary dependency. In
 Thomas> addition, in order for iproute2 to find bison, we need to pass
 Thomas> $(TARGET_MAKE_ENV).

Committed, thanks.

-- 
Bye, Peter Korsgaard
