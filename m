From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 21:18:00 +0100
Subject: [Buildroot] [PATCH 1/1] qt5base: Patch Qt config to detect
 sunxi-mali
In-Reply-To: <1442407978-30060-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1442407978-30060-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <20151117211800.55702750@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Nystr?m,

On Wed, 16 Sep 2015 14:52:58 +0200, Daniel Nystr?m wrote:
> Currently Qt 5.5 only detects and build the eglfs_mali device
> integration if the commercial Mali driver package from ARM is used.
> This patch makes sure the Qt configure script also test for the
> sunxi-mali driver package. It also removes the dependency of
> the proprietary fbdev_window.h.
> 
> This issue is set to be fixed in upcoming Qt 5.6:
> https://codereview.qt-project.org/#/c/125837/
> 
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> ---
>  .../qt5base/0010-fix-eglfs-for-sunxi-mali.patch    | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 package/qt5/qt5base/0010-fix-eglfs-for-sunxi-mali.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
