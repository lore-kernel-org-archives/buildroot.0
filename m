From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2014 22:40:12 +0200
Subject: [Buildroot] [PATCH] xserver: remove patch for aarch64
In-Reply-To: <1397135323-22584-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Thu, 10 Apr 2014 17:08:43 +0400")
References: <1397135323-22584-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87bnw87wb7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > xorg-server-1.15.0.tar.gz already has full support of aarch64.
 > It was added with this commit http://patchwork.freedesktop.org/patch/14361/

 > Even though the patch in question doesn't break patching or building of xserver
 > it duplicates aarch64 entries in "include/servermd.h".

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
