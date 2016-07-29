From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 29 Jul 2016 10:32:15 +0300
Subject: [Buildroot] [PATCH 1/1] gupnp-tools: new package
In-Reply-To: <1469776607-30435-1-git-send-email-fabrice.fontaine@orange.com>
References: <1469776607-30435-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20160729073215.GI3588@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Fri, Jul 29, 2016 at 09:16:47AM +0200, Fabrice Fontaine wrote:
> +ifeq ($(BR2_PACKAGE_GTKSOURCEVIEW),y)
> +GUPNP_TOOLS_DEPENDENCIES += gtksourceview
> +endif

This makes you patch depend on the patch adding the gtksourceview package. So 
you should send both patches in a patch series, with the gtksourceview patch 
before this one. This makes the dependency between patches clearer, making the 
maintainers life easier.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
