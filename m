From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 23 Jul 2007 08:28:55 +0200
Subject: [Buildroot] AT91SAM9260 and u-boot
References: <OF404E49A3.0AC35139-ONC2257321.001D1668-C3257321.00180A94@visonic.com>
Message-ID: <006801c7ccfe$5bae0840$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



>I am trying (without much success...) to configure the buildroot 
> toolchain, 
> to fit the 4K boot memory.
> 
> maybe someone did it already and is willing to send me the '.config' file?
> or maybe someone can tell me what to choose in the following options:
> 
> - target
>    * arm
>    * armeb    <--- is it big-endian?
> 
> -target architecture variant:
>    * arm610
>    * arm710
>    * arm720t
>    * arm920t
>    * arm922t
>    * arm926t
>    * arm1136jf_s
>    * arm1176jz-s
>    * arm1176jzf-s
>    * sa110
>    * sa1100
>    * xscale
>    * iwmmxt
> -target ABI
>    * OABI
>    * EABI     <--- is it with no floating-point HW?
> 
> Sincerely
> shai lifshitz
> email: shail at visonic.com
> 
>

The AT91SAM9260 support is not *fully* functional just yet (working on it),
so you are better off going to www.at91.com and look in the Linux Forum
for the buildroot script.
This will build an at91bootstrap which will fit into 4kB.

It is building with arm, generic-arm, OABI and NWFPE

Best Regards
Ulf Samuelsson
