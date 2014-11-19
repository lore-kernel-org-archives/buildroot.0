From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Nov 2014 23:15:19 +0100
Subject: [Buildroot] [PATCH 4/9] manual: Remove trailing space
In-Reply-To: <1416068964-22529-4-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1416068964-22529-4-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141119221519.GF3779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-11-15 17:29 +0100, Maxime Hadjinlian spake thusly:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-autotools.txt | 2 +-
>  docs/manual/faq-troubleshooting.txt       | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
> index ece6c49..a041d91 100644
> --- a/docs/manual/adding-packages-autotools.txt
> +++ b/docs/manual/adding-packages-autotools.txt
> @@ -125,7 +125,7 @@ cases, typical packages will therefore only use a few of them.
>    variables to pass to the 'autoreconf' program if
>    +LIBFOO_AUTORECONF=YES+. These are passed in the environment of
>    the 'autoreconf' command. By default, empty.
> -  
> +
>  * +LIBFOO_AUTORECONF_OPTS+ to specify additional options
>    passed to the 'autoreconf' program if
>    +LIBFOO_AUTORECONF=YES+. By default, empty.
> diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
> index 693028c..b30b4ac 100644
> --- a/docs/manual/faq-troubleshooting.txt
> +++ b/docs/manual/faq-troubleshooting.txt
> @@ -19,10 +19,10 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK
>  
>  then it means that your system is running, but didn't start a shell on
>  the serial console. In order to have the system start a shell on your
> -serial console, you have to go into the Buildroot configuration, in 
> -+System configuration+, modify +Run a getty (login prompt) after boot+ 
> -and set the appropriate port and baud rate in the +getty options+ 
> -submenu. This will automatically tune the +/etc/inittab+ file of the 
> +serial console, you have to go into the Buildroot configuration, in
> ++System configuration+, modify +Run a getty (login prompt) after boot+
> +and set the appropriate port and baud rate in the +getty options+
> +submenu. This will automatically tune the +/etc/inittab+ file of the
>  generated system so that a shell starts on the correct serial port.
>  
>  [[faq-no-compiler-on-target]]
> -- 
> 2.1.3
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
