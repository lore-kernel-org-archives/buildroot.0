From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Aug 2016 19:19:38 +0200
Subject: [Buildroot] [PATCH v2 2/3] docs: update legal-notice.txt
In-Reply-To: <1471449670-13421-2-git-send-email-romain.naour@gmail.com>
References: <1471449670-13421-1-git-send-email-romain.naour@gmail.com>
 <1471449670-13421-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160817171938.GE5778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-08-17 18:01 +0200, Romain Naour spake thusly:
> Since 1273636fc686cd788b6de87be75dd0726cf8676c applied patches are also
> saved.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/legal-notice.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
> index 0572dae..a4911f7 100644
> --- a/docs/manual/legal-notice.txt
> +++ b/docs/manual/legal-notice.txt
> @@ -41,9 +41,9 @@ There you will find:
>    +host-sources/+ subdirectories for target and host packages respectively.
>    The source code for packages that set +<PKG>_REDISTRIBUTE = NO+ will not be
>    saved.
> -  Patches applied to some packages by Buildroot are distributed with the
> -  Buildroot sources and are not duplicated in the +sources/+ and +host-sources/+
> -  subdirectories.
> +  Patches that were applied are also saved, along with a file named +series+
> +  that lists the patches in the order they were applied. Patches are under the
> +  same license as the files that they modify.
>  * A manifest file (one for host and one for target packages) listing the
>    configured packages, their version, license and related information.
>    Some of this information might not be defined in Buildroot; such items are
> -- 
> 2.5.5
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
