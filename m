From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 29 Apr 2018 14:05:05 +0000
Subject: [Buildroot] [PATCH 1/1] package/cups: bump version to 2.2.7
In-Reply-To: <20180429135123.14206-1-bernd.kuhls@t-online.de>
References: <20180429135123.14206-1-bernd.kuhls@t-online.de>
Message-ID: <CALdGskJQDZXKBadWLR2c+My54vQi-PLB3X3-4kgnLBsoeTV_ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd

I was actually waiting for v2.3 to go stable as the last beta(2.3b4) was
released a month ago. But I suppose this will do in the interrim.

Regards
Olivier

Acked-by: Olivier Schonken <olivier.schonken@gmail.com>


On Sun, 29 Apr 2018, 15:51 Bernd Kuhls, <bernd.kuhls@t-online.de> wrote:

> Added license hash.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/cups/cups.hash | 3 ++-
>  package/cups/cups.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/cups/cups.hash b/package/cups/cups.hash
> index d4f20b60db..a19b3b09a6 100644
> --- a/package/cups/cups.hash
> +++ b/package/cups/cups.hash
> @@ -1,2 +1,3 @@
>  # Locally calculated:
> -sha256 a8795e2aa54dcfbdc9ff254a770f0d7154e35c981bca5b3369050c5193ab5a21
> cups-2.2.5-source.tar.gz
> +sha256 3c4b637b737077565ccdfbd5f61785d03f49461ae736fcc2c0ffaf41d2c6ea6a
> cups-2.2.7-source.tar.gz
> +sha256 6e0e0ffbde118aae709f7ef65590de9071e8b2cd322f84fd645c6b64f3cc452c
> LICENSE.txt
> diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> index 0726d8a37f..54271d5fc7 100644
> --- a/package/cups/cups.mk
> +++ b/package/cups/cups.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -CUPS_VERSION = 2.2.5
> +CUPS_VERSION = 2.2.7
>  CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
>  CUPS_SITE =
> https://github.com/apple/cups/releases/download/v$(CUPS_VERSION)
>  CUPS_LICENSE = GPL-2.0, LGPL-2.0
> --
> 2.14.2
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180429/18888d8f/attachment.html>
