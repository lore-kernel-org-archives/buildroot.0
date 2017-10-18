From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Oct 2017 07:23:55 +0300
Subject: [Buildroot] [PATCH v2] board: Add Bananapi M1 support
In-Reply-To: <1508274727-3807-1-git-send-email-jagan@amarulasolutions.com>
References: <1508274727-3807-1-git-send-email-jagan@amarulasolutions.com>
Message-ID: <20171018042355.d7yuof5i5llb2lcw@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jagan,

On Tue, Oct 17, 2017 at 11:12:07PM +0200, Jagan Teki wrote:
> Add initial support for bananapi M1 board with below features:
> - U-Boot 2017.09
> - Linux 4.13
> - Default packages from buildroot
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---

[...]

> diff --git a/configs/bananapi_m1_defconfig b/configs/bananapi_m1_defconfig
> new file mode 100644
> index 0000000..b571a73
> --- /dev/null
> +++ b/configs/bananapi_m1_defconfig
> @@ -0,0 +1,37 @@
> +BR2_arm=y
> +BR2_cortex_a7=y
> +BR2_ARM_EABIHF=y
> +
> +# Linux headers same as kernel, a 4.11 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y

The comment doesn't match the code.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
