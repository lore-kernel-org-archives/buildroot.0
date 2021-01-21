From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Jan 2021 22:21:31 +0100
Subject: [Buildroot] [PATCH 1/2] package/sysklogd: drop unneeded hash
In-Reply-To: <20210119223109.1168744-1-fontaine.fabrice@gmail.com>
References: <20210119223109.1168744-1-fontaine.fabrice@gmail.com>
Message-ID: <20210121212131.GB2375@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-19 23:31 +0100, Fabrice Fontaine spake thusly:
> Commit 6a91580c1175b098fe2508ca11bfcf621ecbbe9f added the hash of
> 0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch but this
> is not needed as this file is included in buildroot and not downloaded
> 
> While at it, update indentation in hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysklogd/sysklogd.hash | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
> index 9f9fd192e1..978a670d30 100644
> --- a/package/sysklogd/sysklogd.hash
> +++ b/package/sysklogd/sysklogd.hash
> @@ -1,4 +1,3 @@
>  # Locally calculated
> -sha256	09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702	sysklogd-2.1.2.tar.gz
> -sha256	7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477	LICENSE
> -sha256	569321607efe6ba0ecb820b3cb23d933e92f6ab50d2f8fcceb23fc8a43756ef0	0001-Define-_GNU_SOURCE_required_for_O_CLOEXEC_on_uClibc.patch
> +sha256  09fe1edca882a9ae976cdbf516786edc1629347b9507d45dc005d9d969f94702  sysklogd-2.1.2.tar.gz
> +sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
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
