From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 11 Feb 2019 21:18:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/libva-utils: Fix build failure
 when x11 support is disabled
In-Reply-To: <20190211193516.6600-1-bernd.kuhls@t-online.de>
References: <20190211193516.6600-1-bernd.kuhls@t-online.de>
Message-ID: <20190211211853.331594be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Feb 2019 20:35:16 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes
> http://autobuild.buildroot.net/results/2f8/2f89e41f79e8bec1c0561b486ae5750fc87a6320/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...failure-when-x11-support-is-disabled.patch | 33 +++++++++++++++++++
>  package/libva-utils/libva-utils.mk            |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 package/libva-utils/0002-Fix-build-failure-when-x11-support-is-disabled.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
