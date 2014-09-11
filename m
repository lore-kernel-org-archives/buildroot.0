From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Sep 2014 22:49:53 +0200
Subject: [Buildroot] [PATCH] xapp_xdpyinfo: depends on MMU
In-Reply-To: <1410343169-2722-1-git-send-email-yuvaraj.patil@wipro.com>
 (Yuvaraj Patil's message of "Wed, 10 Sep 2014 15:29:29 +0530")
References: <1410343169-2722-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <87ha0ddgr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yuvaraj" == Yuvaraj Patil <yuvaraj.patil@wipro.com> writes:

 > This package needs MMU. Hence added dependency on BR2_USE_MMU
 > Fixes:
 > http://autobuild.buildroot.net/results/2da/2dada0264409d8fa6befedbc02c0de77c605a5fa//

 > Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
