From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Feb 2019 11:17:36 +0100
Subject: [Buildroot] [PATCH v1] package/libxkbcommon: bump version to
 0.8.3
In-Reply-To: <20190211205317.15440-1-ps.report@gmx.net>
References: <20190211205317.15440-1-ps.report@gmx.net>
Message-ID: <20190212111736.2bac1562@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 11 Feb 2019 21:53:17 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> For details see [1]:
> - Fix build of static libraries with meson.
> - New API: XKB_KEY_XF86MonBrightnessCycle/XKB_KEY_XF86RotationLockToggle
> 
> [1] https://lists.freedesktop.org/archives/wayland-devel/2019-February/039970.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Note: The autotools build will be removed in libxkbcommon 0.9.0.
> ---
>  package/libxkbcommon/libxkbcommon.hash | 4 ++--
>  package/libxkbcommon/libxkbcommon.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
