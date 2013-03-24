From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:43:32 +0100
Subject: [Buildroot] [PATCH 10/22] gmp: requires host-m4
In-Reply-To: <1364113606-20836-11-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:34 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwttm0i3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On a system where m4 is not installed, gmp does not build due to the
 Thomas> lack of m4. Add the missing host-m4 dependency.

Committed, thanks.

-- 
Bye, Peter Korsgaard
