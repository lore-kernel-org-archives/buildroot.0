From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Oct 2013 17:09:39 +0300
Subject: [Buildroot] [PATCH] libxmlrpc: new package
In-Reply-To: <1381327119-7553-1-git-send-email-alvaro.gamez@hazent.com>
References: <CAM+bi4ufo+fYffs-aC5T7FSymrfw-qobnSB-iJVKqB70sECwaA@mail.gmail.com>
 <1381327119-7553-1-git-send-email-alvaro.gamez@hazent.com>
Message-ID: <20131009140939.GP4875@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alvaro,

On Wed, Oct 09, 2013 at 03:58:39PM +0200, Alvaro G. M wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

You forgot your own sign off.

[...]

> diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
> new file mode 100644
> index 0000000..78ba161
> --- /dev/null
> +++ b/package/libxmlrpc/libxmlrpc.mk
> @@ -0,0 +1,30 @@
> +################################################################################
> +#
> +# libxmlrpc
> +#
> +################################################################################
> +
> +LIBXMLRPC_VERSION = 1.25.26
> +LIBXMLRPC_SOURCE = xmlrpc-c-$(LIBXMLRPC_VERSION).tgz
> +LIBXMLRPC_SITE = http://downloads.sourceforge.net/project/xmlrpc-c/Xmlrpc-c%20Super%20Stable/1.25.26

Why not reuse $(LIBXMLRPC_VERSION) for the directory part of the URL?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
