From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Apr 2020 19:10:35 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: trim Carlos Santos' watch list
In-Reply-To: <20200428151620.239416-1-unixmania@gmail.com>
References: <20200428151620.239416-1-unixmania@gmail.com>
Message-ID: <20200428171035.GE11346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2020-04-28 12:16 -0300, unixmania at gmail.com spake thusly:
> From: Carlos Santos <unixmania@gmail.com>
> 
> - I fixed build problems on cups and cups-filters but don't use them.
> 
> - gtest, libpam-radius-auth, libpam-tacplus and perl-file-util were
>   used in my previous job. I don't have access to the packages that
>   use them neither to the corresponding test infrastructure anymore.

Thank you for shepherding those packages all that time! :-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> CC: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> ---
>  DEVELOPERS | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fd584bb6e4..b36c9f561b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -506,18 +506,12 @@ F:	package/sunxi-boards/
>  
>  N:	Carlos Santos <unixmania@gmail.com>
>  F:	package/busybox/
> -F:	package/cups/
> -F:	package/cups-filters/
> -F:	package/gtest/
>  F:	package/initscripts/
>  F:	package/intel-microcode/
> -F:	package/libpam-radius-auth/
> -F:	package/libpam-tacplus/
>  F:	package/liburiparser/
>  F:	package/modem-manager/
>  F:	package/pamtester/
>  F:	package/pcm-tools/
> -F:	package/perl-file-util/
>  F:	package/skeleton-custom/
>  F:	package/skeleton-init-common/
>  F:	package/skeleton-init-none/
> -- 
> 2.18.2
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
