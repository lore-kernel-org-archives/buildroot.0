From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 16:16:42 +0100
Subject: [Buildroot] [PATCH 01/13] docs/manual: toolchain packages no
 longer use custom makefiles
In-Reply-To: <1393167879-16637-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223151642.GC3342@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regard,
Yann E. MORIN.

> ---
>  docs/manual/rebuilding-packages.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/docs/manual/rebuilding-packages.txt b/docs/manual/rebuilding-packages.txt
> index 88d6670..da8d230 100644
> --- a/docs/manual/rebuilding-packages.txt
> +++ b/docs/manual/rebuilding-packages.txt
> @@ -69,8 +69,5 @@ files that just tell whether this or that action has been done):
>    Buildroot will trigger the recompilation of the package from the
>    compilation step (execution of +make+).
>  
> -Note: toolchain packages use custom makefiles. Their stamp files are named
> -differently.
> -
>  Further details about package special make targets are explained in
>  xref:pkg-build-steps[].
> -- 
> 1.8.3.2
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
