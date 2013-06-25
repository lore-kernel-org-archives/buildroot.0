From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Jun 2013 23:59:08 +0200
Subject: [Buildroot] [PATCH] libunwind:  new pacakge
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C639A6F946@ex-mb1.corp.adtran.com>
Message-ID: <20130625215908.GD14074@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andy, All,

On 2013-06-25 21:41 +0000, ANDY KENNEDY spake thusly:
> Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
> ---
> diff -Naur a/package/Config.in b/package/Config.in
> --- a/package/Config.in 2013-06-20 10:32:07.000000000 -0500
> +++ b/package/Config.in 2013-06-21 17:00:21.000000000 -0500
> @@ -612,6 +612,7 @@
>  source "package/libtasn1/Config.in"
>  source "package/libtpl/Config.in"
>  source "package/libseccomp/Config.in"
> +source "package/libunwind/Config.in"
>  source "package/liburcu/Config.in"
>  source "package/linux-pam/Config.in"
>  source "package/log4cxx/Config.in"
> diff -Naur a/package/libunwind/Config.in b/package/libunwind/Config.in
> --- a/package/libunwind/Config.in       1969-12-31 18:00:00.000000000 -0600
> +++ b/package/libunwind/Config.in       2013-06-21 17:23:46.000000000 -0500
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBUNWIND
> +	bool "libunwind"
> +	help
> +	  C API to determine the call-chain of a program.
> +
> +	  Project home:  <http://www.nongnu.org/libunwind/index.html>

In addition to other comments, could you please add a changelog to your
patch, and a version number in the subject? Such as:

    [PATCH v3] libunwind: new pacakge

    sob: you

    ---
    Changes v2->v3:
      - blabla
    Changes v1->v2:
      - blabla
      - blabla

This is a least version 3 (or 4?) of this patch, and its hard to tell
what changed between revisions, and to check if suggestions were
applied.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
