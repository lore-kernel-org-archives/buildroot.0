From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Oct 2015 08:27:05 +0300
Subject: [Buildroot] [PATCH] mpkimage: new package
In-Reply-To: <1445291141-6182-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1445291141-6182-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151020052705.GA20889@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Mon, Oct 19, 2015 at 11:45:41PM +0200, Maxime Hadjinlian wrote:
> +config BR2_PACKAGE_HOST_MKPIMAGE
> +	bool "host-mkpimage"

All other host packages (except imx-usb-loader) don't have a dash after "host" 
in the config prompt.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
