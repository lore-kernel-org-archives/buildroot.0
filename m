From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Feb 2017 10:26:41 +0100
Subject: [Buildroot] [PATCH] configs: Update Synopsys VDK for ARC HS38
In-Reply-To: <1485971222-32589-1-git-send-email-abrodkin@synopsys.com> (Alexey
 Brodkin's message of "Wed, 1 Feb 2017 20:47:02 +0300")
References: <1485971222-32589-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <87k296z4q6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This updates Linux kernel for Synopsys ARC HS38 VDK so it matches real
 > platform and while at it bump kernel version to the latest.

 > Main changes:
 >  * Linux kernel v4.9.6 (latest in 4.9.x series in buildroot)
 >  * Add support of MMC controller which is used for rootfs
 >  * Add support of UIO which is used to communicate with EVSS

 > Now with this update image built by vanilla Buildroot VDK has
 > working UART, MMC, LCD, Ethernet, UIO etc.

 > And while at it we rename defconfing so it:
 >  1) Doesn't mention SMP any more - that's the only option anyways now
 >  2) Matches common naming scheme: vendor_arch_platform

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Zakharov Vlad <Vladislav.Zakharov@synopsys.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
