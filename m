From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 11 Mar 2008 19:56:26 +0100
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:at91rm9200df
	at91sam9260dfc at91sam9260p etc...
References: <20080311162106.4D4D3120150@busybox.net>
Message-ID: <014401c883af$e519d510$080514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is wrong.
The AT91 chips either use the "Linux" subdirectory, when there is a common 
patchset with the AVR32,or "arch-arm" when it is only AT91 related.
An AVR32 only patch will reside in "arch-avr32"


Best Regards
Ulf Samuelsson

----- Original Message ----- 
From: <ninevoltz@uclibc.org>
To: <buildroot@uclibc.org>
Sent: Tuesday, March 11, 2008 5:21 PM
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:at91rm9200df at91sam9260dfc at91sam9260p etc...


> Author: ninevoltz
> Date: 2008-03-11 09:21:05 -0700 (Tue, 11 Mar 2008)
> New Revision: 21296
> 
> Log:
> added kernel-patches directories
> 
> Added:
>   trunk/buildroot/target/device/Atmel/at91rm9200df/kernel-patches/
>   trunk/buildroot/target/device/Atmel/at91sam9260dfc/kernel-patches/
>   trunk/buildroot/target/device/Atmel/at91sam9260pf/kernel-patches/
>   trunk/buildroot/target/device/Atmel/at91sam9261ek/kernel-patches/
>   trunk/buildroot/target/device/Atmel/at91sam9263ek/kernel-patches/
> 
> 
> Changeset:
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
