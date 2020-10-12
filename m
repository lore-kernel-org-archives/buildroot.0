From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:32:24 +0200
Subject: [Buildroot] [PATCH 1/1] configs/chromebook_elm: Updating to
 Linux v5.9
In-Reply-To: <20201012143314.674328-1-bilal.wasim@imgtec.com>
References: <20201012143314.674328-1-bilal.wasim@imgtec.com>
Message-ID: <20201012223224.5d951d79@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 12 Oct 2020 19:33:14 +0500
Bilal Wasim <bilalwasim676@gmail.com> wrote:

> Updating the chromebook elm configuration to use v5.9 instead of
> an intermediate release candidate.
> 
> At the latter stages of the v5.9 release, a patch was added which
> broke the Chromebook Elm HDMI. Therefore add a revert patch to
> get rid of this problem. The fix (and the revert) are already on
> the mailing list (https://lkml.org/lkml/2020/10/10/32) and should
> become available with v5.10
> 
> Signed-off-by: Bilal Wasim <bilal.wasim@imgtec.com>
> ---
>  ...tek-dsi-Fix-scrolling-of-panel-with-.patch | 41 +++++++++++++++++++
>  configs/chromebook_elm_defconfig              |  2 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 board/chromebook/elm/patches/linux/0006-Revert-drm-mediatek-dsi-Fix-scrolling-of-panel-with-.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
