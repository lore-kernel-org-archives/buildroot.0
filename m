From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 24 Dec 2016 22:38:33 +0200
Subject: [Buildroot] [PATCH v2] gst1-plugins-bad: Add kmssink support
In-Reply-To: <1482610938-23007-1-git-send-email-festevam@gmail.com>
References: <1482610938-23007-1-git-send-email-festevam@gmail.com>
Message-ID: <20161224203833.34dnani5ugk2yck3@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Sat, Dec 24, 2016 at 06:22:18PM -0200, Fabio Estevam wrote:
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_KMS
> +	bool "kmssink"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libpthread-stubs

Comment should be: libdrm -> libpthread-stubs.

> +	select BR2_PACKAGE_LIBDRM
> +	help
> +	  KMS video sink

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
