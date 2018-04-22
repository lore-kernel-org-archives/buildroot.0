From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Apr 2018 10:05:32 +0200
Subject: [Buildroot] [PATCH 1/1] .gitignore: ignore outgoing directory
In-Reply-To: <20180308142907.3006-1-chrismcc@gmail.com>
References: <20180308142907.3006-1-chrismcc@gmail.com>
Message-ID: <20180422080532.GG12688@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christopher, All,

On 2018-03-08 06:29 -0800, Christopher McCrory spake thusly:
> The buildroot documentation for submitting patches creates a new
> directory "outgoing".  This prevents git from nagging about untracked
> files.
> 
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Peter, this is a candidate for 2018.02.x as well, I guess. ;-)

Regards,
Yann E. MORIN.

> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.gitignore b/.gitignore
> index bb02d9f572..f1a065d95e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,5 +1,6 @@
>  /output
>  /dl
> +/outgoing
>  /.auto.deps
>  /.config.cmd
>  /.config.old
> -- 
> 2.14.3
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
