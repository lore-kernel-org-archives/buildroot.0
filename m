From: inblueswithu <inblueswithu@hotmail.com>
Date: Sat, 28 Jan 2012 12:07:09 +0530
Subject: [Buildroot] U-Boot error while booting
In-Reply-To: <BLU0-SMTP17690347562EB630FDF178CD28F0@phx.gbl>
References: <BLU0-SMTP17690347562EB630FDF178CD28F0@phx.gbl>
Message-ID: <BLU0-SMTP15007213926BE7EDA7C66D6D28F0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hi,
>
> U-boot gave me this error while compiling the Buildroot
>
>     make[1]: Entering directory
>     `/home/inblueswithu/buildroot2/buildroot/output/build/uboot-2011.03'
>     awk '(NF && $1 !~ /^#/) { print $1 ": " $1 "_config; $(MAKE)" }'
>     boards.cfg > .boards.depend
>     make[1]: Leaving directory
>     `/home/inblueswithu/buildroot2/buildroot/output/build/uboot-2011.03'
>     make[1]: Entering directory
>     `/home/inblueswithu/buildroot2/buildroot/output/build/uboot-2011.03'
>     make[1]: *** No rule to make target `U-Boot'.  Stop.
>     make[1]: Leaving directory
>     `/home/inblueswithu/buildroot2/buildroot/output/build/uboot-2011.03'
>     make: ***
>     [/home/inblueswithu/buildroot2/buildroot/output/build/uboot-2011.03/.stamp_configured]
>     Error 2
>
> I tried to google it, but there is not even one error with the same line.
> But I could see variants like : ///
> /
>
>   * /No rule to make target/ .depend
>   * /No rule to make target/ `include/autoconf.mk'
>   * /No rule to make target/ `y_config'
>
> but not with No rule to make target `U-Boot'.Can some one plz help me.
>
> Thanks & Regards
> /inblueswithu/
>
Got that rectified with after using *versatilepb* for the board name in 
U-Boot configuration (in menuconfig).

Thanks & Regards
/inblueswithu/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120128/4b29a7bc/attachment.html>
