From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2021 16:29:10 +0100
Subject: [Buildroot] [PATCH 0/4] ARC updates
In-Reply-To: <20210115200319.4139041-1-vgupta@synopsys.com>
References: <20210115200319.4139041-1-vgupta@synopsys.com>
Message-ID: <20210116152910.GJ2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vineet, All,

On 2021-01-15 12:03 -0800, Vineet Gupta spake thusly:
> PFA assorted ARC changes. Main being a hw config for -mcpu=hs4x which
> schedules code for HS48x dual issue pipeline.

Series applied to master, thanks!

I have however done a bit of changes, so I will reply individually to
affected patches.

Regards,
Yann E. MORIN.

> Thx,
> -Vineet
> 
> Vineet Gupta (4):
>   ARC: Add support for generic HS48 processor
>   configs/snps_archs38_hsdk_defconfig: refresh defconfig
>   configs/snps_archs38_hsdk_defconfig: switch to glibc hard-float
>   configs/snps_archs38_hsdk_defconfig: update for better out-of-box
>     experience
> 
>  arch/Config.in.arc                  | 16 +++++++++----
>  configs/snps_archs38_hsdk_defconfig | 36 +++++++++++++++--------------
>  2 files changed, 30 insertions(+), 22 deletions(-)
> 
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
