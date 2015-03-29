From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2015 23:50:50 +0200
Subject: [Buildroot] [PATCH 12/35] Makefile: remove dubious comment
In-Reply-To: <1427650429-9293-13-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-13-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150329215050.GM4093@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> This comment is a left-over from previous code changes, and it doesn't
> make much sense where it is placed.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index edb122b..5a6f825 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -375,9 +375,6 @@ endif
>  include package/Makefile.in
>  include support/dependencies/dependencies.mk
>  
> -# We also need the various per-package makefiles, which also add
> -# each selected package to TARGETS if that package was selected
> -# in the .config file.
>  include toolchain/*.mk
>  include toolchain/*/*.mk
>  
> -- 
> 2.1.0
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
