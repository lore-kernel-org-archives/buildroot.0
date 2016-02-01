From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 21:26:12 +0100
Subject: [Buildroot] [PATCH 3/3] configs/raspberrypi: add CM dtb
In-Reply-To: <1452197226-15625-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 7 Jan 2016 17:07:06 -0300")
References: <1452197226-15625-1-git-send-email-gustavo@zacarias.com.ar>
 <1452197226-15625-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bn80b2jf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 
 >  # Build the DTBs for A/B and A+/B+ from the kernel sources
 >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
 > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus"
 > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-cm"

It was not clear to me what 'CM' stood for, but some googling shows that
it is compute module.

You also didn't adjust the comment just above to match.

Committed with an extended description and the comment updated. Please
try to write a bit more informative commit messages in the future,
thanks.

-- 
Bye, Peter Korsgaard
