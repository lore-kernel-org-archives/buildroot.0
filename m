From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 02 Aug 2012 09:16:09 +0200
Subject: [Buildroot] [PATCH v2] mxml: add license information
In-Reply-To: <d3a5eeb3604382c11faa97b8104b3c43cc61ea4c.1343879845.git.baruch@tkos.co.il>
References: <d3a5eeb3604382c11faa97b8104b3c43cc61ea4c.1343879845.git.baruch@tkos.co.il>
Message-ID: <501A2939.7030307@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>
> v2: note that the license adds exceptions to LGPLv2+
>
>   package/mxml/mxml.mk |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
> index af1cb26..03850d0 100644
> --- a/package/mxml/mxml.mk
> +++ b/package/mxml/mxml.mk
> @@ -5,6 +5,8 @@
>   #############################################################
>   MXML_VERSION = 2.7
>   MXML_SITE = http://ftp.easysw.com/pub/mxml/$(MXML_VERSION)
> +MXML_LICENSE = LGPLv2+ with exceptions
> +MXML_LICENSE_FILES = COPYING
>   MXML_INSTALL_STAGING = YES
>   
>   MXML_INSTALL_STAGING_OPT = DSTROOT=$(STAGING_DIR) install

Acked-by: Luca Ceresoli <luca@lucaceresoli.net>

Luca
