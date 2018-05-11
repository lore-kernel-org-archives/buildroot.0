From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 May 2018 17:44:28 +0200
Subject: [Buildroot] [PATCH] tmux: bump to version 2.7
In-Reply-To: <32bee885111be89f59e496e5ff088c7a5bf8cf9d.1526016439.git.baruch@tkos.co.il>
References: <32bee885111be89f59e496e5ff088c7a5bf8cf9d.1526016439.git.baruch@tkos.co.il>
Message-ID: <20180511154428.GB9837@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-05-11 08:27 +0300, Baruch Siach spake thusly:
> Add COPYING to license files.
> 
> Update README hash; contest change unrelated to license.

"contest"? Did you mean "contains" or "context"?

Regards,
Yann E. MORIN.

> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/tmux/tmux.hash | 5 +++--
>  package/tmux/tmux.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/tmux/tmux.hash b/package/tmux/tmux.hash
> index 752bbb45164f..27a3ccaaeb61 100644
> --- a/package/tmux/tmux.hash
> +++ b/package/tmux/tmux.hash
> @@ -1,3 +1,4 @@
>  # Locally computed:
> -sha256 b17cd170a94d7b58c0698752e1f4f263ab6dc47425230df7e53a6435cc7cd7e8  tmux-2.6.tar.gz
> -sha256 94e2b1feb1202d3308cc7ab7ec42278d24f10562394bdf269f44649327c8198f  README
> +sha256 9ded7d100313f6bc5a87404a4048b3745d61f2332f99ec1400a7c4ed9485d452  tmux-2.7.tar.gz
> +sha256 59ad3f5d323cb6b97bb3882c454e6176519cd580b2d4db43c5161517385569f1  README
> +sha256 ce75f1345a76c93bd0f413d1b93ff1baa0669f34a7242779a00c1b862b4f813a  COPYING
> diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
> index e380227475a7..deae99717b6a 100644
> --- a/package/tmux/tmux.mk
> +++ b/package/tmux/tmux.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -TMUX_VERSION = 2.6
> +TMUX_VERSION = 2.7
>  TMUX_SITE = https://github.com/tmux/tmux/releases/download/$(TMUX_VERSION)
>  TMUX_LICENSE = ISC
> -TMUX_LICENSE_FILES = README
> +TMUX_LICENSE_FILES = README COPYING
>  TMUX_DEPENDENCIES = libevent ncurses host-pkgconf
>  
>  # Add /usr/bin/tmux to /etc/shells otherwise some login tools like dropbear
> -- 
> 2.17.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
