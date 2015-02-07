From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Feb 2015 22:48:38 +0100
Subject: [Buildroot] [PATCH] Export BR2_EXTERNAL for post-build/support
 scripts
In-Reply-To: <1423064097-1151-1-git-send-email-julian@jusst.de>
References: <1423064097-1151-1-git-send-email-julian@jusst.de>
Message-ID: <20150207214838.GA4080@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julian, All,

On 2015-02-04 16:34 +0100, Julian Scheel spake thusly:
> Especially post-build scripts might want to make use of BR2_EXTERNAL variable,
> so export it.

Peter has applied the alternative patch I submitted.

Thanks for the report! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Julian Scheel <julian@jusst.de>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index e554a30..92ae3fa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -349,6 +349,7 @@ endif
>  # Scripts in support/ or post-build scripts may need to reference
>  # these locations, so export them so it is easier to use
>  export BR2_CONFIG
> +export BR2_EXTERNAL
>  export TARGET_DIR
>  export STAGING_DIR
>  export HOST_DIR
> -- 
> 2.2.1
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
