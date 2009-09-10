From: Shinya Kuribayashi <skuribay@pobox.com>
Date: Thu, 10 Sep 2009 23:02:37 +0900
Subject: [Buildroot] UBOOT 2009.08 & ARM Link Error
In-Reply-To: <87bpljw4lz.fsf@macbook.be.48ers.dk>
References: <A41BAEC7EC0449D8BB97311F11270777@apexjs>
	<87bpljw4lz.fsf@macbook.be.48ers.dk>
Message-ID: <4AA906FD.4000400@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
>>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:
> 
>  Sagaert>  Hi Peter 
>  
>  Sagaert> I ran it outside buildroot to find the problem, from inside
>  Sagaert> buildroot same problem
> 
>  Sagaert> export CROSS_COMPILE=arm-linux-
>  Sagaert> make clean
>  Sagaert> make at91sam9260ek_nandflash_config
>  Sagaert> make
> 
> So that sounds as if it's a problem with u-boot, and nothing to do with
> buildroot.
> 
> Perhaps you could ask on the u-boot list if that's a known problem?

You might be interested in this one:
http://lists.denx.de/pipermail/u-boot/2009-August/058716.html

[ I'm not sure what's going on about U-Boot-ARM these days, sorry.
  If you have any question, please ask on U-Boot ML! ]
