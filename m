From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Oct 2014 16:21:56 +0200
Subject: [Buildroot] [PATCH] ympd: Depends on MMU
In-Reply-To: <1412691098-2614-1-git-send-email-yuvaraj.patil@wipro.com>
 (Yuvaraj Patil's message of "Tue, 7 Oct 2014 19:41:38 +0530")
References: <1412691098-2614-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <87sij0gdtn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yuvaraj" == Yuvaraj Patil <yuvaraj.patil@wipro.com> writes:

 > This package needs MMU. Hence added dependency on BR2_USE_MMU
 > Fixes:
 > http://autobuild.buildroot.net/results/834/8340e69763e263fcf20e73f75eafcb31989e9f51//

 > Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
