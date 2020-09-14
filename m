From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 08:43:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/pdmenu: bump to version 1.3.6
In-Reply-To: <20200914054719.3188508-1-fontaine.fabrice@gmail.com>
References: <20200914054719.3188508-1-fontaine.fabrice@gmail.com>
Message-ID: <20200914084306.3b378bff@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Sep 2020 07:47:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Update site to get latest release
> - Update indentation in hash file
> - This bump will also fix a build failure with gcc 10 thanks to
>   https://git.joeyh.name/index.cgi/pdmenu.git/commit/?id=1a2dce9aaa6cdd0406f0be666929562d3b4521ff
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/78946a381f9f70975b41d24b0b050ba2073d6ef8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, after one small fix, see below.

> -PDMENU_VERSION = 1.3.4
> -PDMENU_SOURCE = pdmenu_$(PDMENU_VERSION).tar.gz
> -PDMENU_SITE = http://snapshot.debian.org/archive/debian/20170828T160058Z/pool/main/p/pdmenu
> +PDMENU_VERSION = 1.3.6
> +PDMENU_SOURCE = pdmenu-$(PDMENU_VERSION).tar.gz

This is the default value, so it's not needed, and actually causes a
check-package warning.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
