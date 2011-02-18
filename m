From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 18 Feb 2011 21:21:35 +0100
Subject: [Buildroot] Problem with gmp library
In-Reply-To: <AANLkTikFLQ8AdekPMkaZzEUFJPxb22W2FmZaoBkfSYcS@mail.gmail.com>
References: <AANLkTimDr-hb4wUZBG+tqavQyDhiRZJ791n==JgbmU+w@mail.gmail.com>
	<AANLkTikFLQ8AdekPMkaZzEUFJPxb22W2FmZaoBkfSYcS@mail.gmail.com>
Message-ID: <AANLkTikgbWnPj3CJ7-PcV78YyeVxBHQrd9sugp1vKNgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2011/2/18 Zden?k Materna <zdenek.materna@gmail.com>:
> Here is Buildroot's .config, and config.log of mpfr and gmp. I'm sorry for
> another mail - forgot to attach link in previous one.
>
> http://sestka.zlutaponorka.com/zd/logs.zip

I tried your .config in git master and cannot reproduce the error
(Ubuntu 10.10 64-bit host).
(There were som other build errors, but not related to this.)

1. Have you tried fully cleaning your Buildroot directory and building
it again? Still errors?
2. If it still fails, try updating your tree to git master (and do a
full clean before building).

BTW, you could use 'make qemu_arm_versatile_defconfig' in git master
as base for the Olimex SAM9-L9260 board, just change the kernel
settings.

Best regards,
Bj?rn Forsman
