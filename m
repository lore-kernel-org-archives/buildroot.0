From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 11 Aug 2016 21:15:48 +0300
Subject: [Buildroot] [PATCH] gcc: rename option for ARC gcc
In-Reply-To: <1470921938-11550-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470921938-11550-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160811181548.GJ845@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Aug 11, 2016 at 03:25:38PM +0200, Thomas Petazzoni wrote:
> +config BR2_GCC_VERSION_4_8_ARC
> +	bool "gcc arc option renamed"
> +	select BR2_LEGACY
> +	help
> +	  The option is select the gcc version for the ARC

Maybe: "The option that selects..."

baruch

> +	  architecture has been renamed to BR2_GCC_VERSION_ARC.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
