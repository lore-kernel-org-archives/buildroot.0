From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Tue, 01 May 2018 05:24:11 +0000
Subject: [Buildroot] [PATCH 2/2] cups: disable pam support
In-Reply-To: <399e1f6584e1296686974096bc97c027988f3899.1525115956.git.baruch@tkos.co.il>
References: <91db976709291253cb9914a411a9d75872165f75.1525115956.git.baruch@tkos.co.il>
 <399e1f6584e1296686974096bc97c027988f3899.1525115956.git.baruch@tkos.co.il>
Message-ID: <CALdGsk+DhdZL17wdi7SusJYnnFu+nt97DydjuOrKP0KZ9O_mmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Acked-by: Olivier Schonken <olivier.schonken@gmail.com>

On Mon, 30 Apr 2018, 21:21 Baruch Siach, <baruch@tkos.co.il> wrote:

> Make the build consistent.
>
> Cc: Olivier Schonken <olivier.schonken@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/cups/cups.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 54271d5fc769..8f33824879ee 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -24,6 +24,7 @@ CUPS_CONF_OPTS = \
>         --without-java \
>         --without-php \
>         --disable-gssapi \
> +       --disable-pam \
>         --libdir=/usr/lib
>  CUPS_CONFIG_SCRIPTS = cups-config
>  CUPS_DEPENDENCIES = \
> --
> 2.17.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180501/09dad201/attachment.html>
