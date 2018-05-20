From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 May 2018 19:27:04 +0200
Subject: [Buildroot] [PATCH 0/6] arch/ar: add cortex-m7,
 and cortex-M FPUs
In-Reply-To: <20180520192243.207524ca@windsurf>
References: <cover.1519589817.git.yann.morin.1998@free.fr>
 <20180520192243.207524ca@windsurf>
Message-ID: <20180520172704.GD3453@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-05-20 19:22 +0200, Thomas Petazzoni spake thusly:
> On Sun, 25 Feb 2018 21:18:14 +0100, Yann E. MORIN wrote:
> > Yann E. MORIN (6):
> >       arch/arm: add cortex-m7 core
> >       arch/arm: introduce generic FPU internal option
> >       arch/arm: add option for FPv4 FPU
> >       arch/arm: add options for FPv5 FPU
> >       arch/arm: cortex-m4 may have an FPv4 FPU
> >       arch/arm: cortex-m7 may have a FPv5 FPU
> 
> Entire series applied to next.

Thank you! ;-)

> As discussed on IRC, I initially screwed up and applied PATCH 1/6 on
> the master branch, so I reverted it, and applied the whole thing on the
> next branch.

Fortunately, a highly-sedulous vigilante was quick to notice the issue
and prompt the revert! ;-]

Thanks! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
