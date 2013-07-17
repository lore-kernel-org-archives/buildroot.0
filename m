From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jul 2013 22:46:15 +0200
Subject: [Buildroot] [PATCHv3 0/4] EABI vs EABIhf check
In-Reply-To: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374093050-30344-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130717204615.GE3385@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-17 22:30 +0200, Thomas Petazzoni spake thusly:
> Third version of the EABI vs EABIhf check, which takes into account
> the comments from Yann E. Morin:
> 
>  * Added quoting where needed.
>  * Fixed the comment in Config.in.arm
> 
> Thanks!
> 
> Thomas
> 
> Thomas Petazzoni (4):
>   toolchain/helpers: don't use the x$(...) = x"value" syntax
>   toolchain: check ARM EABI vs. EABIhf for external toolchains
>   toolchain/toolchain-external: don't use x$(...) construct or ==
>   arch/arm: update VFPv2 comment to mention ARMv5

For the whole series:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
