From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 23:58:05 +0100
Subject: [Buildroot] [PATCH 00/15] Drop non-largefile support
In-Reply-To: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150314225805.GR4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-03-13 15:21 -0300, Gustavo Zacarias spake thusly:
> Here's the first attempt at dropping largefile support as discussed
> on the mailing list.
> 
> Gustavo Zacarias (15):
>   toolchain/helpers: add mandatory check for uclibc toolchain options
>   toolchain/helpers: make LFS mandatory for uclibc
>   toolchain-common: default to Y for LARGEFILE
>   toolchain: remove LARGEFILE selects
>   gcc/final: drop non-lfs builds
>   package infra: drop non-lfs support
>   package/uclibc: drop non-largefile support
>   configs: drop largefile option
>   busybox: force lfs build
>   system: drop largefile depends
>   boot/gummiboot: drop largefile depends
>   packages: remove (non-)lfs dependencies and tweaks
>   toolchain-common: drop BR2_LARGEFILE
>   packages: remove non-lfs enabler patches
>   docs/manual: remove references to largefile

I've reviewed all but patch 12 and 14, they are pretty big but I don't
expect you fubared those! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
