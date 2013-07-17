From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jul 2013 19:09:34 +0200
Subject: [Buildroot] [PATCHv2 4/4] arch/arm: update VFPv2 comment to
 mention ARMv5
In-Reply-To: <1374048801-7666-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1374048801-7666-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1374048801-7666-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130717170934.GD3385@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-17 10:13 +0200, Thomas Petazzoni spake thusly:
> Commit 6b3a0417c4 ('arch/arm: arm926 may have VFP') forgot to update
> the help text of the VFPv2 option to mention ARMv5. This commit fixes
> that.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  arch/Config.in.arm | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index b2fe257..096fc48 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -193,8 +193,8 @@ config BR2_ARM_FPU_VFPV2
>  	depends on BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_MAYBE_HAS_VFPV2
>  	help
>  	  This option allows to use the VFPv2 floating point unit, as
> -	  available in some ARMv6 processors (ARM1136JF-S,
> -	  ARM1176JZF-S and ARM11 MPCore).
> +	  available in some ARMv5 processors (ARM926EJ-S) ARMv6
                                                        ^^^
Weird sentence construction. What about:
    [...] in some ARMv5 processors (ARM926EJ-S), and in some ARMv6 [...]
                                               ^^^^^^^^^^^^^

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
