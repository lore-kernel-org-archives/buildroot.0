From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Aug 2020 15:20:28 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix typo
In-Reply-To: <20200822192001.1836121-1-fontaine.fabrice@gmail.com>
References: <20200822192001.1836121-1-fontaine.fabrice@gmail.com>
Message-ID: <20200823132028.GD8728@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, all,

On 2020-08-22 21:20 +0200, Fabrice Fontaine spake thusly:
> depednencies -> dependencies
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-qmake.txt | 2 +-
>  docs/manual/adding-packages-waf.txt   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-qmake.txt b/docs/manual/adding-packages-qmake.txt
> index 8d26023904..e1621e914e 100644
> --- a/docs/manual/adding-packages-qmake.txt
> +++ b/docs/manual/adding-packages-qmake.txt
> @@ -34,7 +34,7 @@ will automatically download the tarball from this location.
>  
>  On line 10, we tell Buildroot what options to enable for libfoo.
>  
> -On line 11, we tell Buildroot the depednencies of libfoo.
> +On line 11, we tell Buildroot the dependencies of libfoo.
>  
>  Finally, on line line 13, we invoke the +qmake-package+
>  macro that generates all the Makefile rules that actually allows the
> diff --git a/docs/manual/adding-packages-waf.txt b/docs/manual/adding-packages-waf.txt
> index ffc004c290..101cddf1f1 100644
> --- a/docs/manual/adding-packages-waf.txt
> +++ b/docs/manual/adding-packages-waf.txt
> @@ -34,7 +34,7 @@ will automatically download the tarball from this location.
>  
>  On line 10, we tell Buildroot what options to enable for libfoo.
>  
> -On line 11, we tell Buildroot the depednencies of libfoo.
> +On line 11, we tell Buildroot the dependencies of libfoo.
>  
>  Finally, on line line 13, we invoke the +waf-package+
>  macro that generates all the Makefile rules that actually allows the
> -- 
> 2.28.0
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
