From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:28:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: fix build with NLS
In-Reply-To: <20190421172716.31468-1-fontaine.fabrice@gmail.com>
References: <20190421172716.31468-1-fontaine.fabrice@gmail.com>
Message-ID: <20190422222818.7708a010@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 21 Apr 2019 19:27:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/d53978fb30d77cb4d10921bf721eff3d066567ce
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...eson.build-link-with-lintl-if-needed.patch | 38 +++++++++++++++++++
>  package/ncmpc/ncmpc.mk                        |  7 +++-
>  2 files changed, 44 insertions(+), 1 deletion(-)
>  create mode 100644 package/ncmpc/0002-meson.build-link-with-lintl-if-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
