From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Aug 2016 13:59:29 +0200
Subject: [Buildroot] [PATCH 2/2] doc: add libtool issue as Know issues
In-Reply-To: <1471259370-2914-2-git-send-email-romain.naour@gmail.com>
References: <1471259370-2914-1-git-send-email-romain.naour@gmail.com>
 <1471259370-2914-2-git-send-email-romain.naour@gmail.com>
Message-ID: <20160815115929.GD5822@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

In title: "Know" -> "Known".

On 2016-08-15 13:09 +0200, Romain Naour spake thusly:
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> ---
>  docs/manual/known-issues.txt     | 4 ++++
>  support/legal-info/README.header | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> index acfe4ff..d89507e 100644
> --- a/docs/manual/known-issues.txt
> +++ b/docs/manual/known-issues.txt
> @@ -33,3 +33,7 @@
>  * The +prboom+ package triggers a compiler failure with the SuperH 4
>    compiler from Sourcery CodeBench, version 2012.09.
>  
> +* [2016.08] The libtool patches are not listed as package patches due
> +  to a technical issue. Thereby they are not taken into account by the
> +  legal-info infra. This will be fixed in a follow up Buildroot

s/(infra)/\1structure/

> +  release.
> diff --git a/support/legal-info/README.header b/support/legal-info/README.header
> index 1f3524f..6ba8b56 100644
> --- a/support/legal-info/README.header
> +++ b/support/legal-info/README.header
> @@ -20,6 +20,9 @@ This material is composed of the following items.
>     with a file named 'series' that lists the patches in the order they were
>     applied. Patches are under the same license as the files that they modify
>     in the original package.
> +   Note: Libtool patches from support/libtool/buildroot-libtool-v*..patch,
                                                                  ---^
Superfluous dot.

> +   used by autotools based packages, have not been saved due to technical
> +   limitations, you may need to collect it manually.

*to collect them

Otherwsie:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>   * A manifest file listing the configured packages and related information.
>   * The license text of the packages; they have been saved in the licenses/
>     subdirectory.
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
