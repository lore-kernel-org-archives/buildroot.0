From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 Aug 2014 10:06:12 +0200
Subject: [Buildroot] [PATCH] procps-ng: Depends on MMU
In-Reply-To: <1407907968-2554-1-git-send-email-yuvaraj.patil@wipro.com>
 (Yuvaraj Patil's message of "Wed, 13 Aug 2014 11:02:48 +0530")
References: <1407907968-2554-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <87zjf74hsb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yuvaraj" == Yuvaraj Patil <yuvaraj.patil@wipro.com> writes:

 > This package needs MMU. Hence added dependency on BR2_USE_MMU
 > Fixes:
 > http://autobuild.buildroot.net/results/f24/f24aa16857e91fb6b03f9ac7ab0442fedcab8546//

 > Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
