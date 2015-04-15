From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2015 09:23:43 -0300
Subject: [Buildroot] wide-dhcpv6 crash when built in buildroot version
 2014.05 using a cross toolchain arm-buildroot-linux-gnueabihf with gcc
 version 4.8.3
In-Reply-To: <620A1A0EF5A8FD49AAB6076B610B85DD45C35001@LTX-EXCH03.int.lantronix.com>
References: <620A1A0EF5A8FD49AAB6076B610B85DD45C35001@LTX-EXCH03.int.lantronix.com>
Message-ID: <552E584F.5010809@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/15/2015 08:27 AM, Srinivasan R wrote:

> Hi Gustavo Zacarias,
>   Thanks for reply,
> Can you please give me any link for the manual that gives the example of newer make file format that buildroot's latest version will accept?
> Meantime, the defconfig I am using is "toro_defconfig".
> 
> Regards,
> Srini.

Hi.
Please keep the list in cc@
There's no such thing as toro_defconfig in vanilla buildroot, so it's
either a fork/customized.
The documents are online, see:
http://www.buildroot.net/downloads/manual/manual.html#generic-package-reference
A quick generic package to use as sample could be eeprog, there are many
others, it depends on the complexity you're facing.
Regards.
