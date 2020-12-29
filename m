From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 18:15:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/graphicsmagick: fix license hash
In-Reply-To: <20201229095059.4181577-1-fontaine.fabrice@gmail.com>
References: <20201229095059.4181577-1-fontaine.fabrice@gmail.com>
Message-ID: <20201229171525.GS1680670@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-12-29 10:50 +0100, Fabrice Fontaine spake thusly:
> Commit 3591056cd2ae04db3a73c50530bdc927773f26f8 forgot to update hash of
> Copyright.txt (footer removed by
> https://sourceforge.net/p/graphicsmagick/code/ci/86e54c771a8287c6aeba8fa778a7bb1bd02ff61c)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/60c4c46c4cf7aed788c25980d3beff8777da99d8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/graphicsmagick/graphicsmagick.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
> index 5a006dd160..6ad5de9d65 100644
> --- a/package/graphicsmagick/graphicsmagick.hash
> +++ b/package/graphicsmagick/graphicsmagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
>  sha256  5d5b3fde759cdfc307aaf21df9ebd8c752e3f088bb051dd5df8aac7ba7338f46  GraphicsMagick-1.3.36.tar.xz
> -sha256  1d28851631892098e0bf8653fd4e89f3524184d136391b54c664e89251ca3a9a  Copyright.txt
> +sha256  aed5bd8e28cbce601cbe2ca2267b663ccd63152965f2d5caea1311bf0039c325  Copyright.txt
> -- 
> 2.29.2
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
