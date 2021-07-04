From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 10:08:48 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: document the <pkg>-reinstall
 target
In-Reply-To: <20210703194001.693553-2-thomas.petazzoni@bootlin.com>
References: <20210703194001.693553-1-thomas.petazzoni@bootlin.com>
 <20210703194001.693553-2-thomas.petazzoni@bootlin.com>
Message-ID: <20210704080848.GB2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-07-03 21:40 +0200, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index 472af5a318..74c238cb20 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1151,6 +1151,7 @@ help:
>  	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
>  	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
>  	@echo '  <pkg>-rebuild          - Restart the build from the build step'
> +	@echo '  <pkg>-reinstall        - Restart the build from the install step'
>  	$(foreach p,$(HELP_PACKAGES), \
>  		@echo $(sep) \
>  		@echo '$($(p)_NAME):' $(sep) \
> -- 
> 2.31.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
