From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 03 Feb 2013 21:37:41 +0100
Subject: [Buildroot] [PATCH] heirloom-mailx: needs fork()
In-Reply-To: <1359921142-28296-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 3 Feb 2013 20:52:22 +0100")
References: <1359921142-28296-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fw1d3zhm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> heirloom-mailx uses fork(), so we can't use it as is on !mmu
 Thomas> platforms.

Committed, thanks.

-- 
Bye, Peter Korsgaard
