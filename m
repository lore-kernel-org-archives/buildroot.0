From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Mar 2014 00:19:27 +0100
Subject: [Buildroot] [PATCH 6/6] manual/adding-packages-tips.txt: reword
 part about package name
In-Reply-To: <1395353250-9475-7-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1395353250-9475-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1395353250-9475-7-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140320231927.GF20862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

On 2014-03-20 23:07 +0100, Jerzy Grzegorek spake thusly:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-tips.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 73c25be..ceaba8e 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -31,7 +31,7 @@ using the following rules:
>    +BR2_PACKAGE_FOO_BAR_BOO+);
>  
>  * the +*.mk+ file variable prefix is the upper case _package name_
> -  `.` and `-` characters substituted with `_` (e.g.:
> +  with `.` and `-` characters substituted with `_` (e.g.:
>    +FOO_BAR_BOO_VERSION+).
>  
>  
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
