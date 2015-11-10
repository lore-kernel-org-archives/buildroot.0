From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Tue, 10 Nov 2015 16:09:01 +0100
Subject: [Buildroot] [PATCH 2/2] arch: add tune options for powerpc
	e5500 and e6500
In-Reply-To: <1446818745-32224-2-git-send-email-arnout@mind.be>
References: <1446818745-32224-1-git-send-email-arnout@mind.be>
 <1446818745-32224-2-git-send-email-arnout@mind.be>
Message-ID: <CAM+bi4s0N0kUY69SYV+nJ4o=y824G89N_OcbiEykROuoBcUEVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout

It seems that these two patches completely solve the issues I was having
with this architecture, so please consider both of them to be tested.

Tested-by: Alvaro G. M <alvaro.gamez@hazent.com>

2015-11-06 15:05 GMT+01:00 Arnout Vandecappelle (Essensium/Mind) <
arnout@mind.be>:

> These were forgotten when the subarches were added in cd88e49.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Alvaro Gamez <alvaro.gamez@hazent.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  arch/Config.in.powerpc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
> index 95bcaee..8581a4d 100644
> --- a/arch/Config.in.powerpc
> +++ b/arch/Config.in.powerpc
> @@ -200,6 +200,8 @@ config BR2_GCC_TARGET_CPU
>         default "e300c2"        if BR2_powerpc_e300c2
>         default "e300c3"        if BR2_powerpc_e300c3
>         default "e500mc"        if BR2_powerpc_e500mc
> +       default "e5500"         if BR2_powerpc_e5500
> +       default "e6500"         if BR2_powerpc_e6500
>         default "power4"        if BR2_powerpc_power4
>         default "power5"        if BR2_powerpc_power5
>         default "power6"        if BR2_powerpc_power6
> --
> 2.6.2
>
>


-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151110/7e6bf9d6/attachment.html>
