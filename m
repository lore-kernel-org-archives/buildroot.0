From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Aug 2014 22:40:21 +0200
Subject: [Buildroot] [PATCH] manual: Add atomic intrinsics to the
 dependencies section
In-Reply-To: <1407154628-12791-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <20140803113216.03e0fb94@free-electrons.com>
 <1407154628-12791-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140815204021.GA25897@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anton, All,

On 2014-08-04 16:17 +0400, Anton Kolesov spake thusly:
> Add atomic intrinsics to the examples of dependencies comments.
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-directory.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> index 93e6a3e..4b4d056 100644
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -265,6 +265,10 @@ use in the comment.
>  ** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
>  ** Comment string: +dynamic library+
>  
> +* Atomic intrinsics
> +** Dependency symbol: +!BR2_TOOLCHAIN_HAS_ATOMIC_INTRINSICS+
> +** Comment string: +atomic intrinsics+
> +
>  ==== Dependencies on a Linux kernel built by buildroot
>  
>  Some packages need a Linux kernel to be built by buildroot. These are
> -- 
> 1.8.4.1
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
