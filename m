From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jan 2021 17:02:41 +0100
Subject: [Buildroot] [PATCH] package/readline: bump to version 8.1
In-Reply-To: <20210109074123.2202-1-francois.perrad@gadz.org>
References: <20210109074123.2202-1-francois.perrad@gadz.org>
Message-ID: <20210110160241.GT3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2021-01-09 08:41 +0100, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/readline/readline.hash | 4 ++--
>  package/readline/readline.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/readline/readline.hash b/package/readline/readline.hash
> index 560154c2f..63172f112 100644
> --- a/package/readline/readline.hash
> +++ b/package/readline/readline.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256 e339f51971478d369f8a053a330a190781acb9864cf4c541060f12078948e461  readline-8.0.tar.gz
> +sha256  f8ceb4ee131e3232226a17f51b164afc46cd0b9e6cef344be87c65962cb82b02  readline-8.1.tar.gz
>  
>  # Hash for license file
> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/readline/readline.mk b/package/readline/readline.mk
> index f5d7d5bf9..e48055133 100644
> --- a/package/readline/readline.mk
> +++ b/package/readline/readline.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -READLINE_VERSION = 8.0
> +READLINE_VERSION = 8.1
>  READLINE_SITE = $(BR2_GNU_MIRROR)/readline
>  READLINE_INSTALL_STAGING = YES
>  READLINE_DEPENDENCIES = ncurses host-autoconf
> -- 
> 2.27.0
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
