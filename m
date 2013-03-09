From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 09 Mar 2013 21:11:09 +0100
Subject: [Buildroot] [PATCH 1/5] aircrack-ng: disable on non-MMU systems
In-Reply-To: <1362853290-15592-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 9 Mar 2013 19:21:26 +0100")
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1362853290-15592-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehfo2v1e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> aircrack-ng uses fork() and therefore fails to build on non-MMU
 Thomas> systems:

Committed, thanks.

-- 
Bye, Peter Korsgaard
