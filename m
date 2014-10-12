From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Oct 2014 15:44:00 +0200
Subject: [Buildroot] [PATCH] docs/manual: remove example comment causing
 issues
In-Reply-To: <1413120085-21063-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413120085-21063-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141012134400.GA3674@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-12 15:21 +0200, Thomas Petazzoni spake thusly:
> The manual gives this example for using the github macro:
> 
>   FOO_VERSION = v1.0 # tag or full commit ID
> 
> Unfortunately, people copy/pasting this example will face weird make
> errors, because it leads the FOO_VERSION variable to end with a
> space. Since the manual is anyway explaining just below the example
> that FOO_VERSION can be used either with a tag or a full commit ID,
> the simplest solution is to simply remove this comment.
> 
> Reported-by: Edd Robbins <edd.robbins@gmail.com>
> Cc: Edd Robbins <edd.robbins@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-tips.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
> index 0d4fcb0..fde0a44 100644
> --- a/docs/manual/adding-packages-tips.txt
> +++ b/docs/manual/adding-packages-tips.txt
> @@ -42,7 +42,7 @@ on GitHub. As GitHub is known to have changed download mechanisms in the
>  past, the 'github' helper function should be used as shown below.
>  
>  ------------------------
> -FOO_VERSION = v1.0 # tag or full commit ID
> +FOO_VERSION = v1.0
>  FOO_SITE = $(call github,<user>,<package>,$(FOO_VERSION))
>  ------------------------
>  
> -- 
> 2.0.0
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
