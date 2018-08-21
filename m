From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 15:16:07 +0200
Subject: [Buildroot] [PATCH 01/18] perl-dbi: add host package
In-Reply-To: <20180820115519.24046-2-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-2-chrismcc@gmail.com>
Message-ID: <CAGhdn56y79pG4e43aWZqZ6iG-CivGMqG_6q_cMBwj4GtVpuD+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-20 13:55 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>

---
>  package/perl-dbi/perl-dbi.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/perl-dbi/perl-dbi.mk b/package/perl-dbi/perl-dbi.mk
> index f7ae6ca5a1..4ee9149f1f 100644
> --- a/package/perl-dbi/perl-dbi.mk
> +++ b/package/perl-dbi/perl-dbi.mk
> @@ -11,3 +11,4 @@ PERL_DBI_LICENSE = Artistic or GPL-1.0+
>  PERL_DBI_LICENSE_FILES = LICENSE
>
>  $(eval $(perl-package))
> +$(eval $(host-perl-package))
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/6f3574f0/attachment.html>
