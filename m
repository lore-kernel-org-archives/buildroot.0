From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 14:15:00 +0200
Subject: [Buildroot] lego ev3 defconfig
Message-ID: <874m4dizaz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

You added the lego_ev3_defconfig 2 years ago. Do you still have an ev3?

The defconfig is using gcc 4.7 with a note that the kernel doesn't boot
with 4.8 - But gcc 4.7 is deprecated and we are about to remove it, so
that isn't really good.

I see that there's a number of newer kernel version available on

https://github.com/ev3dev/ev3-kernel/releases

Could you perhaps test if one of these work with our default gcc (5.x)?
Thanks.

-- 
Bye, Peter Korsgaard
