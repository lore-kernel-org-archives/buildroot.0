From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:18:24 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/fb-test-app: Install
 fb-test-string
In-Reply-To: <20210617183647.71636-1-andriy.shevchenko@linux.intel.com>
References: <20210617183647.71636-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20210629191824.GG2829@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy, All,

On 2021-06-17 21:36 +0300, Andy Shevchenko spake thusly:
> fb-test-app suite provides a simple app to draw text on a given frame buffer.
> Install it as well.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fb-test-app/fb-test-app.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
> index 1be59a4207cb..f6e949015ef8 100644
> --- a/package/fb-test-app/fb-test-app.mk
> +++ b/package/fb-test-app/fb-test-app.mk
> @@ -18,6 +18,7 @@ define FB_TEST_APP_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/rect $(TARGET_DIR)/usr/bin/fb-test-rect
>  	$(INSTALL) -D -m 0755 $(@D)/fb-test $(TARGET_DIR)/usr/bin/fb-test
>  	$(INSTALL) -D -m 0755 $(@D)/offset $(TARGET_DIR)/usr/bin/fb-test-offset
> +	$(INSTALL) -D -m 0755 $(@D)/fb-string $(TARGET_DIR)/usr/bin/fb-test-string
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.30.2
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
