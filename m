From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Thu, 9 Aug 2018 08:16:23 -0700
Subject: [Buildroot] [PATCH] ncurses: disable terminfo database install
 for host-ncurses
In-Reply-To: <20180809145722.388-1-peter@korsgaard.com>
References: <20180809145722.388-1-peter@korsgaard.com>
Message-ID: <d52e8000-19ac-e5e6-7392-486ad26d488c@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/2018 07:57 AM, Peter Korsgaard wrote:
> diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
> index 5b36df564c..e27598bd42 100644
> --- a/package/ncurses/ncurses.mk
> +++ b/package/ncurses/ncurses.mk
> @@ -154,6 +154,7 @@ HOST_NCURSES_CONF_OPTS = \
>   	--without-cxx-binding \
>   	--without-ada \
>   	--with-default-terminfo-dir=/usr/share/terminfo \
> +	--disable-db-install \
>   	--without-normal
>   
>   $(eval $(autotools-package))
Acked-by: Hollis Blanchard <hollis_blanchard@mentor.com>

-- 
Hollis Blanchard
Mentor Graphics Emulation Division
