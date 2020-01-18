From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2020 18:56:29 +0100
Subject: [Buildroot] [PATCH 1/2] docs/manual/legal-notice.txt: update
 list of non-saved material
In-Reply-To: <20200118161820.12412-1-luca@lucaceresoli.net>
References: <20200118161820.12412-1-luca@lucaceresoli.net>
Message-ID: <20200118175629.GD32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2020-01-18 17:18 +0100, Luca Ceresoli spake thusly:
> This list dates back to 2012. Since a long time now Buildroot saves the
> patches applied as well as the actual source code for some external
> toolchains. Update the manual accordingly.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Both applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/legal-notice.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 69753282ec30..179aa6b1798e 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -67,9 +67,8 @@ for packages released under BSD-like licenses, that you are not required to
>  redistribute in source form.
>  
>  Moreover, due to technical limitations, Buildroot does not produce some
> -material that you will or may need, such as the toolchain source code and the
> -Buildroot source code itself (including patches to packages for which source
> -distribution is required).
> +material that you will or may need, such as the toolchain source code for
> +some of the external toolchains and the Buildroot source code itself.
>  When you run +make legal-info+, Buildroot produces warnings in the +README+
>  file to inform you of relevant material that could not be saved.
>  
> -- 
> 2.25.0
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
