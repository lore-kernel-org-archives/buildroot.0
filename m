From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 30 Apr 2009 03:28:08 -0300
Subject: [Buildroot] Broken u-boot 2009.x, undeprecate u-boot 2008.10
In-Reply-To: <20090430073104.684a701c@hcegtvedt.norway.atmel.com>
References: <d6cda7730904291655h63596d78p7227b0f7c7b6ca23@mail.gmail.com>
	<20090430073104.684a701c@hcegtvedt.norway.atmel.com>
Message-ID: <d6cda7730904292328h7a48188ao9012ae0dd5dda91e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2009/4/30 Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>:
> Last working version for AVR32 is 2008.10 :/ The 2009.01 release had
> another issue, which H?vard just spotted before release, too late to do
> the fix. 2009.03 is broken regarding JFFS2, at least for AVR32.

From what I've seen of the fix at the maintainer tree, it should
affect all platforms. I just find it funny that no one has complained
before.

>> ? ?Should we deal with 2009.03 and 2009.01 in any special way? (Drop
>> them, comment as broken JFFS2?)
>>
>
> At least make 2008.10 available, and lets hope 2009.05 can make us dump
> all the previous ones.
>

Done. But I wonder if we should take more steps in this regard. One
thing is to have packages that don't build, another is a package that
builds but fails at run time with known upstream bugs. Being the
bootloader, it could brick boards from unaware users without a JTAGICE
mkII.

Kind Regards,
    Thiago A. Correa
