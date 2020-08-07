From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Aug 2020 11:39:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-rpi-gpio: fix build with
 gcc 10.x
In-Reply-To: <20200807081727.17947-1-mf@go-sys.de>
References: <20200807081727.17947-1-mf@go-sys.de>
Message-ID: <20200807113943.0a962969@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 7 Aug 2020 10:17:27 +0200
Michael Fischer <mf@go-sys.de> wrote:

> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  ...hon-rpi-gpio-fix-build-with-gcc-10.x.patch | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch
> 
> diff --git a/package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch b/package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch
> new file mode 100644
> index 0000000000..961b8b398a
> --- /dev/null
> +++ b/package/python-rpi-gpio/0001-package-python-rpi-gpio-fix-build-with-gcc-10.x.patch

All patches need a proper commit log and description, with a
Signed-off-by line. See:

  https://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
