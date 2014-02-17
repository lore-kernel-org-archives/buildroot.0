From: Frank Ihle <frank.ihle@hs-offenburg.de>
Date: Mon, 17 Feb 2014 09:23:43 +0100
Subject: [Buildroot] Antw: Re: How to get the kernel to mount a rootfs
 without an initramfs ?? (2)
In-Reply-To: <5301456B.7080504@mind.be>
References: <52FC9329020000460004A9FA@gwia2.rz.hs-offenburg.de>
 <5301456B.7080504@mind.be>
Message-ID: <5301D51F020000460004AC30@gwia2.rz.hs-offenburg.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I was thinking the same when I read those lines. But a bad sign may be 
not the right word, when u-boot is able to handle the SD device. So the 
kernel just isn't able to find what he actually should. Sadly my time is
 running short and I can't figure out right now what's the problem. 
Thanks for the help so far.

Kind Regards,

Frank

> I'm not familiar with the Atmel MCI controller, but my gut feeling says
> that all these zeroes are a bad sign.
>
 > As I said before: you should check the BSP for your board, there is
> probably something wrong there.
> 
 > For sure, this issue is not buildroot-related. It's purely kernel-related.
>
>
 > Regards,
 > Arnout
> 
> atmel_mci atmel_mci.0: Atmel MCI controller at 0xf0008000 irq 12, 1 slots
> mmc_host mmc0: card is not present
> mmc1: clock 0Hz busmode 1 powermode 0 cs 0 Vdd 0 width 0 timing 0
> atmel_mci atmel_mci.1: Atmel MCI controller at 0xf000c000 irq 26, 1 slots
> mmc_host mmc1: card is not present
> 
> (Yes the card is in the slot ;)
> [snip]
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140217/08a57dbe/attachment.html>
