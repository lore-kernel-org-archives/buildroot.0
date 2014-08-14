From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Aug 2014 10:09:10 +0200
Subject: [Buildroot] [PATCH] tftpd: depends on MMU
In-Reply-To: <1407908043-2700-1-git-send-email-yuvaraj.patil@wipro.com>
 (Yuvaraj Patil's message of "Wed, 13 Aug 2014 11:04:03 +0530")
References: <1407908043-2700-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <87vbpv4hnd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yuvaraj" == Yuvaraj Patil <yuvaraj.patil@wipro.com> writes:

 > This package needs MMU. Hence added dependency on BR2_USE_MMU
 > Fixes:
 > http://autobuild.buildroot.net/results/3e1/3e16d8c9ae3b77393e082c3dd9b7b3de9aa040c0//

 > Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
