From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Mar 2016 21:20:40 +0100
Subject: [Buildroot] [PATCH 2/2] docs: fix syntax error in
 makedev-syntax example. In the makedev syntax documentation,
 one of the examples lacks the "mode" value.
In-Reply-To: <1457294608-2129-2-git-send-email-alan@tkos.co.il>
References: <1457294608-2129-1-git-send-email-alan@tkos.co.il>
 <1457294608-2129-2-git-send-email-alan@tkos.co.il>
Message-ID: <20160308202039.GB3856@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alan, All,

On 2016-03-06 22:03 +0200, Alan Yaniger spake thusly:
> Signed-off-by: Alan Yaniger <alan@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/makedev-syntax.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
> index 0bbc16e..e4dffc9 100644
> --- a/docs/manual/makedev-syntax.txt
> +++ b/docs/manual/makedev-syntax.txt
> @@ -44,7 +44,7 @@ this syntax, you will need to write:
>  ----
>  /usr/bin/foo f 755 0 0 - - - - -
>  /usr/bin/bar f 755 root root - - - - -
> -/data/buz f buz-user buz-group - - - - -
> +/data/buz f 644 buz-user buz-group - - - - -
>  ----
>  
>  Alternatively, if you want to change owner/permission of a directory
> -- 
> 1.9.1
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
