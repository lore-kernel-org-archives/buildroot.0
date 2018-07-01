From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 11:06:44 +0200
Subject: [Buildroot] [PATCH] qt5: bump latest version to 5.11.1
In-Reply-To: <20180628202910.20238-1-gael.portay@savoirfairelinux.com>
References: <20180628202910.20238-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180701110644.78b8580d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 28 Jun 2018 16:29:10 -0400, Ga?l PORTAY wrote:
> qtwebengine:
> 
> 	Remove 0001-Fix-build-with-GCC-8.1.0.patch (upstream since
> 	[1]).
> 
> [1]: https://github.com/qt/qtwebengine/commit/08db7562bf7709122807f151cab710b3fd9d7c19
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/qt5/qt5.mk                                 |  2 +-
>  package/qt5/qt53d/qt53d.hash                       |  4 +-
>  ...001-qtbase-Fix-build-error-when-using-EGL.patch |  0
>  package/qt5/qt5base/qt5base.hash                   |  4 +-
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
>  package/qt5/qt5charts/qt5charts.hash               |  4 +-
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
>  package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
>  package/qt5/qt5location/qt5location.hash           |  4 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
>  package/qt5/qt5script/qt5script.hash               |  4 +-
>  package/qt5/qt5scxml/qt5scxml.hash                 |  4 +-
>  package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
>  package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
>  package/qt5/qt5svg/qt5svg.hash                     |  4 +-
>  package/qt5/qt5tools/qt5tools.hash                 |  4 +-
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +-
>  package/qt5/qt5wayland/qt5wayland.hash             |  4 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
>  .../5.11.0/0001-Fix-build-with-GCC-8.1.0.patch     | 86 ----------------------
>  package/qt5/qt5webengine/qt5webengine.hash         |  4 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
>  29 files changed, 53 insertions(+), 139 deletions(-)
>  rename package/qt5/qt5base/{5.11.0 => 5.11.1}/0001-qtbase-Fix-build-error-when-using-EGL.patch (100%)
>  delete mode 100644 package/qt5/qt5webengine/5.11.0/0001-Fix-build-with-GCC-8.1.0.patch

Applied to master, thanks. Thanks Peter for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
