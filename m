From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 1 Jun 2015 06:07:35 +0300
Subject: [Buildroot] [PATCH 1/1] package/pppd: install pon/poff option
In-Reply-To: <1433125147-11903-1-git-send-email-rdkehn@yahoo.com>
References: <1433125147-11903-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150601030735.GQ2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Doug,

On Sun, May 31, 2015 at 09:19:07PM -0500, Doug Kehn wrote:
> +config BR2_PACKAGE_PPPD_PON_POFF
> +	bool "pon poff scripts"
> +	help
> +	  Install pon and poff scripts.

No need to add an option for these scripts. Their size is negligible (less 
than 5K combined) compared to pppd itself. Just install them unconditionally.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
