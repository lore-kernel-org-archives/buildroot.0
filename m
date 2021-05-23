From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 13:50:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/blktrace: add
 BLKTRACE_CPE_ID_VENDOR
In-Reply-To: <20210523102757.1518238-1-fontaine.fabrice@gmail.com>
References: <20210523102757.1518238-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523115027.GQ3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-23 12:27 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:blktrace_project:blktrace is a valid CPE identifier for this
> package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ablktrace_project%3Ablktrace
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/blktrace/blktrace.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/blktrace/blktrace.mk b/package/blktrace/blktrace.mk
> index 4ada2e8e4b..1a5f59bcce 100644
> --- a/package/blktrace/blktrace.mk
> +++ b/package/blktrace/blktrace.mk
> @@ -9,6 +9,7 @@ BLKTRACE_SITE = http://brick.kernel.dk/snaps
>  BLKTRACE_DEPENDENCIES = libaio
>  BLKTRACE_LICENSE = GPL-2.0+
>  BLKTRACE_LICENSE_FILES = COPYING
> +BLKTRACE_CPE_ID_VENDOR = blktrace_project
>  
>  # 0001-btt-make-device-devno-use-PATH_MAX-to-avoid-overflow.patch
>  BLKTRACE_IGNORE_CVES += CVE-2018-10689
> -- 
> 2.30.2
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
