From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Nov 2014 18:06:07 +0100
Subject: [Buildroot] [PATCHv3 32/74] iostat: don't install man page
In-Reply-To: <1417357142-14307-33-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-33-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141130170606.GL4124@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-30 15:18 +0100, Thomas Petazzoni spake thusly:
> We don't support installing documentation on the target, so there's no
> point in having explicit code to do so.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/iostat/iostat.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
> index 8610f8f..2080e56 100644
> --- a/package/iostat/iostat.mk
> +++ b/package/iostat/iostat.mk
> @@ -17,8 +17,6 @@ endef
>  
>  define IOSTAT_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
> -	$(INSTALL) -D $(IOSTAT_DIR)/iostat.8 \
> -		$(TARGET_DIR)/usr/share/man/man8/iostat.8
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.1.0
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
