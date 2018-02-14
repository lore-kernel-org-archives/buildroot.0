From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Wed, 14 Feb 2018 11:19:27 -0600
Subject: [Buildroot] [PATCH 3/3] pure-ftpd: Config.in: fix help text
 wrapping
In-Reply-To: <20180214050458.32281-4-gael.portay@savoirfairelinux.com>
References: <20180214050458.32281-1-gael.portay@savoirfairelinux.com>
 <20180214050458.32281-4-gael.portay@savoirfairelinux.com>
Message-ID: <CAH=K+6n+y_0yyh-4KVNttVGCAsB_ARiFnHxBvWu9zSizwZdh8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 13, 2018 at 11:04 PM, Ga?l PORTAY
<gael.portay@savoirfairelinux.com> wrote:
> This commit fixes the warnings reported by check-package on the help
> text of package Config.in file, related to the formatting of the help
> text: should start with a tab, then 2 spaces, then at most 62
> characters.

I thought I checked this, sorry.

>
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Acked-by: Sam Voss <sam.voss@rockwellcollins.com>

> ---
>  package/pure-ftpd/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pure-ftpd/Config.in b/package/pure-ftpd/Config.in
> index d03170b7cf..c060102650 100644
> --- a/package/pure-ftpd/Config.in
> +++ b/package/pure-ftpd/Config.in
> @@ -33,7 +33,7 @@ config BR2_PACKAGE_PURE_FTPD_QUOTAS
>  config BR2_PACKAGE_PURE_FTPD_UPLOADSCRIPT
>         bool "uploadscript"
>         help
> -         Enable pure-upload script. Automatically run an external program
> -         after a successful upload.
> +         Enable pure-upload script. Automatically run an external
> +         program after a successful upload.
>
>  endif
> --
> 2.15.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
