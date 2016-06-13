From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jun 2016 22:33:24 +0200
Subject: [Buildroot] [PATCH 2/6] docs/manual: don't mention eglibc,
 mention musl
In-Reply-To: <1465422059-22254-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1465422059-22254-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160613203324.GC3786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-06-08 23:40 +0200, Thomas Petazzoni spake thusly:
> Following the removal of eglibc, it no longer makes sense to talk about
> it in the Buildroot manual as one of the supported C libraries. However,
> it does make sense to indicate that we support musl.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  docs/manual/configure.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index 44f5d24..8491b17 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -83,7 +83,7 @@ applications and libraries for your target embedded system.
>  This backend supports several C libraries:
>  http://www.uclibc.org[uClibc], the
                                  ^^^
While at it, you may want to remove that...

Otherwise, you missed one on line 224:

    224:* Not limited to uClibc: glibc and eglibc toolchains are supported.

Although this is talking about external toolchains. So I'm not sure we
want to drop it there.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  http://www.gnu.org/software/libc/libc.html[glibc] and
> -http://www.eglibc.org[eglibc].
> +http://www.musl-libc.org[musl].
>  
>  Once you have selected this backend, a number of options appear. The
>  most important ones allow to:
> -- 
> 2.7.4
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
