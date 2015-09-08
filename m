From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Sep 2015 15:26:22 +0200
Subject: [Buildroot] Right board to use -- buildroot begniers
In-Reply-To: <CAKpDV8tWg7ZU6UUZSvp=jM6CM2KnTSNvzy6cfx0OhkCMY+gxwg@mail.gmail.com>
References: <CAKpDV8sGQrmePsmbhrQo0YMGTLLTZb4Rsq90W3Y4nfMZTrcS+A@mail.gmail.com>
 <55EDE7A6.4060902@mind.be>
 <CAKpDV8udG2fRi8RWJbb=5nPNJ3SnYUE6dsPPmD11vnwUFzLL1A@mail.gmail.com>
 <55EE8B90.9060708@mind.be>
 <20150908120122.7662cb86@free-electrons.com>
 <20150908112832.GC3237@piout.net>
 <CAKpDV8tWg7ZU6UUZSvp=jM6CM2KnTSNvzy6cfx0OhkCMY+gxwg@mail.gmail.com>
Message-ID: <20150908152622.52c11f06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dinesh,

Could you improve a bit the way you quote text when replying to
e-mails? Your quoting style makes it quite hard to reply.

On Tue, 8 Sep 2015 18:04:28 +0530, Dinesh Guleria wrote:
> >> don't need that.
> But seggers jlink(i.e jtag tool) can be used as an alternative tool to burn
> uboot , kernel to NAND of this board right ?

Yes, probably.

> >> The Atmel SoCs have a built-in "monitor" that you
> can talk to over the USB device port. It requires a tool called SAM-BA.
> Ok great. So i need only a hardware USB cable for this no external hardware
> device right ?

Yes, correct.

> So i can burn uboot, kernel & rfilesystem to the board NAND flash using usb
> cable & SAM-BA software tool, right ?

Absolutely.

> >> you're looking at beginning with the Atmel Xplained, you can follow
> the slides/labs
> Thanks for pointing me to such a wonderful material, it means a lot to me.
> Do these two below link point to same board which is mentioned on your site
> ?
> http://www.element14.com/community/mobile/mobile-access.jspa#jive-content?content=%2Fapi%2Fcore%2Fv3%2Fcontents%2F625493
> 
> http://www.atmel.com/tools/ATSAMA5D3-XPLD.aspx

Yes, it is this board.

> >> Atmel's plan is to deprecate their Buildroot fork
> >> It is deprecated, this will be announced this week.
> I did not understood this statement on one hand you are saying buildroot
> supports Atmel SAM soc & on other hand you are saying support will be
> depreciated from next week.

Atmel used to have a fork of Buildroot with the support for their
boards. Instead of having such a fork, they decided to now support
their boards directly in the official Buildroot. Their fork is
therefore no longer necessary and will be deprecated. Just use the
official Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
