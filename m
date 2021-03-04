From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 18:37:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: fix tarball hash
In-Reply-To: <20210304114202.1237328-1-fontaine.fabrice@gmail.com>
References: <20210304114202.1237328-1-fontaine.fabrice@gmail.com>
Message-ID: <20210304173715.GM2275@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, Michael, All,

On 2021-03-04 12:42 +0100, Fabrice Fontaine spake thusly:
> Fix hash added by commit 28c7ff0bdb602e75d2891818ff87fe7fd4ed0015:
> https://patchwork.ozlabs.org/project/buildroot/patch/20210104101054.5392-1-jubalh at iodoru.org

Arg... Updating a tag after the fact is not a nice thing to do, ever...
Just push a new tag, and never mind for the bad one.

I've added the explanations from Michael to the commit log, and applied
to master, thanks.

Fortunately, our backup mirror hasn't had the time to cache the tarball,
so we won't have to handle that...

Regards,
Yann E. MORIN.

> While at it, also update indentation in hash file (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2f13af96eee20176ccb37ad32ec1472b4c9d6208
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libstrophe/libstrophe.hash | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
> index 6aca289fb5..d5f151660f 100644
> --- a/package/libstrophe/libstrophe.hash
> +++ b/package/libstrophe/libstrophe.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256 4918c47029ecdea2deab4b0f9336ca4a8bb12c28b72b2cec397d98664b94c771  libstrophe-0.10.1.tar.gz
> -sha256 82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
> -sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
> +sha256  5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39  libstrophe-0.10.1.tar.gz
> +sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
> -- 
> 2.30.0
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
