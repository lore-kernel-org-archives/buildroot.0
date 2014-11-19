From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Nov 2014 23:21:41 +0100
Subject: [Buildroot] [PATCH 6/9] manual: Add newline before block code
In-Reply-To: <1416068964-22529-6-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1416068964-22529-6-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141119222141.GH3779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-11-15 17:29 +0100, Maxime Hadjinlian spake thusly:
> This won't change the output, it's only a style issue.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-directory.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index c145829..0ea03f9 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -191,15 +191,19 @@ construct rather than repeating the +depends on+ statement on the
>  comment and other config options.
>  
>  The general format of a dependency +comment+ for package foo is:
> +
>  --------------------------
>  foo needs a toolchain w/ featA, featB, featC
>  --------------------------
>  
>  for example:
> +
>  --------------------------
>  aircrack-ng needs a toolchain w/ largefile, threads
>  --------------------------
> +
>  or
> +
>  --------------------------
>  crda needs a toolchain w/ threads
>  --------------------------
> @@ -283,6 +287,7 @@ foo needs a Linux kernel to be built
>  
>  If there is a dependency on both toolchain options and the Linux
>  kernel, use this format:
> +
>  --------------------------
>  foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
>  --------------------------
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
