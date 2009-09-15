From: Teemu Keskinarkaus <Teemu.Keskinarkaus@cc-systems.com>
Date: Tue, 15 Sep 2009 13:31:59 +0200
Subject: [Buildroot] Building buildroot without U-boot
In-Reply-To: <87vdjk1miw.fsf@macbook.be.48ers.dk>
References: <330EC2471BF24E48B513AF1A6975EB69B00909@MAIL-UA.ccs.local>
	<87vdjk1miw.fsf@macbook.be.48ers.dk>
Message-ID: <330EC2471BF24E48B513AF1A6975EB69B00931@MAIL-UA.ccs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter
> Korsgaard
> >>>>> "Teemu" == Teemu Keskinarkaus
<Teemu.Keskinarkaus@cc-systems.com>
> writes:
> 
>  Teemu> Hi,
> 
>  Teemu> In older version there was selection in menuconfig if to build
>  Teemu> U-boot or not, but in latest stable version that selection is
>  Teemu> removed and U-boot is build everytime. Problem is that I don?t
>  Teemu> need it and more importantly it won?t compile okay. What is
the
>  Teemu> correct way to disable U-boot from building if there is any?
> 
>  Ehh, Target filesystem options -> Das U-Boot Boot Monitor is here
just
>  like it used to be. Just disable that option and it won't get built.

Oh, so I see. I was actually using the Ulf Samuelsson's version of the
buildroot and mistakenly said that I was using latest stable. In Ulf's
version there the U-boot is represent differently.

Thanks anyway.

-Teemu
