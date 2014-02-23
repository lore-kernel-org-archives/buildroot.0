From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Feb 2014 17:06:12 +0100
Subject: [Buildroot] [PATCH 13/13] docs/manual: mention the per-package
 graph-depends target
In-Reply-To: <1393167879-16637-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1393167879-16637-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140223160612.GA32759@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-23 16:04 +0100, Thomas Petazzoni spake thusly:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/package-make-target.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
> index 9eefe68..bd514f4 100644
> --- a/docs/manual/package-make-target.txt
> +++ b/docs/manual/package-make-target.txt
> @@ -63,6 +63,11 @@ Additionally, there are some other useful make targets:
>  | +show-depends+    | Displays the dependencies required to build the
>  package
>  
> +| +graph-depends+   | Generate a dependency graph of the package, in the
> +context of the current Buildroot configuration. See
> +xref:graph-depends[this section] for more details about dependency
> +graphs.
> +
>  | +dirclean+        | Remove the whole package build directory
>  
>  | +rebuild+         | Re-run the compilation commands - this only makes
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
