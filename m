From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Jul 2013 07:30:00 +0200
Subject: [Buildroot] [PATCH] arch/arm: arm926 may have VFP
In-Reply-To: <1374021165-30809-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 16 Jul 2013 21:32:45 -0300")
References: <1374021165-30809-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txjtycrr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The VFP9-S FPU (VFPv2) is optional for ARM926EJ-S, see:
 Gustavo> http://www.arm.com/products/processors/classic/arm9/arm926.php?tab=Specifications+
 Gustavo> Real silicon:
 Gustavo> http://www.nxp.com/documents/data_sheet/LPC3180.pdf

Committed, thanks.

-- 
Bye, Peter Korsgaard
