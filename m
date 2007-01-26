From: Ulf Samuelsson <ulfs@dof.se>
Date: Fri, 26 Jan 2007 01:47:11 +0100
Subject: [Buildroot] [PATCH] Prepatory patch to Config.in to
	allowAT91/AVR32 support	(Resend)
References: <1169772235.28479.2.camel@elrond.sweden.atmel.com>
Message-ID: <00e501c740e3$87edf020$01c4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
>> Author: Ulf Samuelsson
>> Date: 2007-01-25

Hmm, for everyone that is now confused:
I sent a first version, which had  a small problem.

Then sent a second (updated) version which was reported as sent, but
at the same time the email reader crashed and
I did not receive it, so I sent the (updated) version once again
with no changes to the patch.
At the same time the first (updated) version seems to have left my 
machine...


>>
>> Log:
>> 1) Prepatory patch to allow AVR32/AT91 support.
>> 2) Introduce AVR32 target architecture "avr32"
>> 3) Introduce AVR32 target variants (AP7000/AP7010/AP7020)
>> 4) Introduce Download location for patches/packages for Atmel chips
>> (BR2_ATMEL_MIRROR)
>> 5) Introduce Download location for Community AT91 patches/packages
>> (BR2_AT91_PATCH_MIRROR)
>>
>> Modified:
>> Config.in
>>
>> Changeset
>> Config.in
>>
>> ---------------
>> Resend with a bug fix
>>
>> Best Regards
>> Ulf Samuelsson
>>
>



>
>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot

Best Regards,
Ulf Samuelsson
