From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Dec 2014 21:39:44 +0100
Subject: [Buildroot] [PATCH] w_scan: bump version to 20141122
In-Reply-To: <1417714796-65316-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1417714796-65316-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141207203944.GE3902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-12-04 17:39 +0000, Vicente Olivert Riera spake thusly:
> - Bump version to 20141122
> - Add a hash file
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hash manually checked.

Regards,
Yann E. MORIN.

> ---
>  package/w_scan/w_scan.hash |    2 ++
>  package/w_scan/w_scan.mk   |    2 +-
>  2 files changed, 3 insertions(+), 1 deletions(-)
>  create mode 100644 package/w_scan/w_scan.hash
> 
> diff --git a/package/w_scan/w_scan.hash b/package/w_scan/w_scan.hash
> new file mode 100644
> index 0000000..4c336f3
> --- /dev/null
> +++ b/package/w_scan/w_scan.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  b6d7c9ab997c53a0b0d92e8390f313cc3b82ee8ece1756b4e526119fd5ba09b4  w_scan-20141122.tar.bz2
> diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
> index 44f3193..3ec84ed 100644
> --- a/package/w_scan/w_scan.mk
> +++ b/package/w_scan/w_scan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -W_SCAN_VERSION = 20140118
> +W_SCAN_VERSION = 20141122
>  W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
>  W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
>  W_SCAN_LICENSE = GPLv2+
> -- 
> 1.7.1
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141207/f179c577/attachment.asc>
