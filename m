From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 26 Sep 2016 09:08:53 +0300
Subject: [Buildroot] [PATCH v2] package/linux-tools: add gpio
In-Reply-To: <20160926055547.29069-1-m.niestroj@grinn-global.com>
References: <20160926055547.29069-1-m.niestroj@grinn-global.com>
Message-ID: <20160926060853.j5rndjakbbwddai5@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Marcin,

On Mon, Sep 26, 2016 at 07:55:47AM +0200, Marcin Niestroj wrote:
> +config BR2_PACKAGE_LINUX_TOOLS_GPIO
> +	bool "gpio"
> +	help
> +	  gpio is a collection of tools to get information about,
> +	  control and monitor gpios present on system.
> +
> +	  These tools use new gpio ABI which will deprecate sysfs gpio
> +	  interface in the future.

Please mention here that you need kernel version 4.8+.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
