From: Dinesh Guleria <din.gulu.er@gmail.com>
Date: Tue, 8 Sep 2015 18:04:28 +0530
Subject: [Buildroot] Right board to use -- buildroot begniers
In-Reply-To: <20150908112832.GC3237@piout.net>
References: <CAKpDV8sGQrmePsmbhrQo0YMGTLLTZb4Rsq90W3Y4nfMZTrcS+A@mail.gmail.com>
 <55EDE7A6.4060902@mind.be>
 <CAKpDV8udG2fRi8RWJbb=5nPNJ3SnYUE6dsPPmD11vnwUFzLL1A@mail.gmail.com>
 <55EE8B90.9060708@mind.be>
 <20150908120122.7662cb86@free-electrons.com>
 <20150908112832.GC3237@piout.net>
Message-ID: <CAKpDV8tWg7ZU6UUZSvp=jM6CM2KnTSNvzy6cfx0OhkCMY+gxwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> don't need that.
But seggers jlink(i.e jtag tool) can be used as an alternative tool to burn
uboot , kernel to NAND of this board right ?

>> The Atmel SoCs have a built-in "monitor" that you
can talk to over the USB device port. It requires a tool called SAM-BA.
Ok great. So i need only a hardware USB cable for this no external hardware
device right ?
http:// <http://www.atmel.com/tools/atmelsam-bain-systemprogrammer.aspx>
www.atmel.com
<http://www.atmel.com/tools/atmelsam-bain-systemprogrammer.aspx>/tools/
<http://www.atmel.com/tools/atmelsam-bain-systemprogrammer.aspx>
atmelsam-bain-systemprogrammer.aspx
<http://www.atmel.com/tools/atmelsam-bain-systemprogrammer.aspx>

So i can burn uboot, kernel & rfilesystem to the board NAND flash using usb
cable & SAM-BA software tool, right ?

>> you're looking at beginning with the Atmel Xplained, you can follow
the slides/labs
Thanks for pointing me to such a wonderful material, it means a lot to me.
Do these two below link point to same board which is mentioned on your site
?
http://www.element14.com/community/mobile/mobile-access.jspa#jive-content?content=%2Fapi%2Fcore%2Fv3%2Fcontents%2F625493

http://www.atmel.com/tools/ATSAMA5D3-XPLD.aspx

>> Atmel's plan is to deprecate their Buildroot fork
>> It is deprecated, this will be announced this week.
I did not understood this statement on one hand you are saying buildroot
supports Atmel SAM soc & on other hand you are saying support will be
depreciated from next week.

Regards
Katoch

Hi,

On 08/09/2015 at 12:01:22 +0200, Thomas Petazzoni wrote :
> Arnout,
>
> On Tue, 8 Sep 2015 09:17:36 +0200, Arnout Vandecappelle wrote:
>
> > > http:// <http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>
www.at91.com <http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>/
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>linux4sam
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>/bin/view/
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>Linux4SAM
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>/
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>BuildRoot
<http://www.at91.com/linux4sam/bin/view/Linux4SAM/BuildRoot>
> >
> >  Well, the linux4sam fork is relatively old. In addition, there are
some changes
> > in it that are incorrect. So I'd stick to upstream buildroot :-)
>
> My colleague Alexandre Belloni has recently updated or added numerous
> Atmel defconfigs, and Atmel's plan is to deprecate their Buildroot fork
> and to just tell people to use the upstream version (at least that's
> what I understood).
>
> Alex?
>

It is deprecated, this will be announced this week.

--
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http:// <http://free-electrons.com>free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150908/51905773/attachment.html>
