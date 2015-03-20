From: =?UTF-8?B?VmluY2VudCBTdGVobMOp?= <vincent.stehle@freescale.com>
Date: Fri, 20 Mar 2015 15:53:14 +0100
Subject: [Buildroot] [PATCH] configs: add defconfig for Freescale i.MX31
 PDK
In-Reply-To: <550B3F16.60600@mind.be>
References: <1426585422-22441-1-git-send-email-vincent.stehle@freescale.com>
 <550A0AF9.5050101@mind.be> <550AED3F.4070606@freescale.com>
 <550B3F16.60600@mind.be>
Message-ID: <550C345A.9070307@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2015 10:26 PM, Arnout Vandecappelle wrote:
..
> It doesn't look like it's using DT, but there's a mach-mx31_3ds.c that uses the
> old platform approach. Of course your bootloader has to set the correct machine
> ID (1151) in that case.

Hi Arnout,

Thanks for pointing that out; it helped a lot.

After some experiments, it seems that sadly, mainline kernel will
not boot anymore on i.MX31 PDK, starting with v3.16 and up to
current v4.0-rc4.

Now for the good news: I have a working buildroot defconfig based
on mainline kernel v3.15.10, with zero patch.
  I will post a patch v4 right away; could you please maybe
forget about the patch v3 I posted, and look at this v4 instead?

Thank you for your help all along!

Best regards,

V.
