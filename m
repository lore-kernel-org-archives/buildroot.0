From: Piotr Grudzinski <piotr@powersmiths.com>
Date: Mon, 7 Jan 2008 11:05:46 -0500
Subject: [Buildroot] Buildroot fails at libstdc++
References: <36163.1199717483@powersmiths.com>
	<029101c85141$ba33f330$030514ac@atmel.com>
Message-ID: <00ca01c85147$2a5cc5b0$7b01a8c0@Piotr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the suggestion to try gcc-4.2.1 but what I would find helpful is 
to start with a configuration which was successful and created a functional 
tool for a generic arm, nomad, no FP, soft-float, little-Endean system.

Best Regards,
Port

----- Original Message ----- 
From: "Ulf Samuelsson" <ulf@atmel.com>
To: <buildroot@uclibc.org>
Sent: Monday, January 07, 2008 10:16 AM
Subject: Re: [Buildroot] Buildroot fails at libstdc++


>> Hi all,
>>
>> I am having a problem with taking the buildroot process pass the 
>> libstdc++ phase.
>> Here is my setup:
>
>> buildroot snapshot 2008-01-02
>
>> binutils 2.18
>> kernel   2.6.22.10
>> gcc      3.4.6
>> uClibc   0.9.29
>
> Maybe you should try with gcc-4.2.1
> Best Regards
> Ulf Samuelsson
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot 
