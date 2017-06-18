From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 11:02:54 +0200
Subject: [Buildroot] [PATCH 01/14] docs/manual: update external
 toolchain advantages list
In-Reply-To: <ac90c9ca01909f447e928bc62942bd91889d3909.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
 <ac90c9ca01909f447e928bc62942bd91889d3909.1497583686.git.baruch@tkos.co.il>
Message-ID: <20170618090254.GA2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-06-16 06:32 +0300, Baruch Siach spake thusly:
> Buildroot can build non-uClibc toolchains internally for quite some time now.
> Update the manual text.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/configure.txt | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index 0739bc7c8c78..945f5b11b730 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -221,8 +221,6 @@ Advantages of this backend:
>    often very significant in the overall build time of an embedded
>    Linux system.
>  
> -* Not limited to uClibc: glibc and eglibc toolchains are supported.
> -
>  Drawbacks of this backend:
>  
>  * If your pre-built external toolchain has a bug, may be hard to get a
> -- 
> 2.11.0
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
