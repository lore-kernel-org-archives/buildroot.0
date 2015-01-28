From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 28 Jan 2015 07:51:51 +0200
Subject: [Buildroot] [RFC 5/8] ccache: add custom help entries
In-Reply-To: <1422394913-13257-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1422394913-13257-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1422394913-13257-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150128055151.GP2555@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jan 27, 2015 at 10:41:50PM +0100, Thomas Petazzoni wrote:
[...]
> +define HOST_CCACHE_PACKAGE_HELP
> +	@$(call pkg-print-help-opt,ccache-stats,"Show ccache statistics")
> +	@$(call pkg-print-help-opt,cache-options,"Update ccache options using CCACHE_OPTIONS variable")

s/cache-options/ccache-options/

> +endef
> +
> +HOST_CCACHE_HELP_HOOKS += HOST_CCACHE_PACKAGE_HELP
> +

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
