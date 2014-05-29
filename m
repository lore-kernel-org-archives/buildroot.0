From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 29 May 2014 17:22:01 +0200
Subject: [Buildroot] [PATCH 1/1] manual: Fix BR2_GLOBAL_PATCH_DIR example
In-Reply-To: <1401376172-27514-1-git-send-email-sebastien.roy@savoirfairelinux.com>
References: <1401376172-27514-1-git-send-email-sebastien.roy@savoirfairelinux.com>
Message-ID: <20140529152201.GA3556@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sebastien, All,

On 2014-05-29 11:09 -0400, Sebastien Roy spake thusly:
>     As discussed on irc, there is a missing part in the BR2_GLOBAL_PATCH_DIR
>     example compared to the ASCII figure under customize-packages section.
> 
> Signed-off-by: Sebastien Roy <sebastien.roy@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/customize-packages.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
> index 6f70bdb..b4ed0b5 100644
> --- a/docs/manual/customize-packages.txt
> +++ b/docs/manual/customize-packages.txt
> @@ -86,7 +86,7 @@ If the user has the +BR2_GLOBAL_PATCH_DIR+ configuration option set as
>  follows:
>  
>  -----
> -BR2_GLOBAL_PATCH_DIR="board/common-fooarch board/fooarch-board"
> +BR2_GLOBAL_PATCH_DIR="board/common-fooarch/patches board/fooarch-board/patches"
>  -----
>  
>  Then the patches would applied as follows for the Linux kernel:
> -- 
> 1.9.3
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
