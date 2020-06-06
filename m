From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:50:44 +0200
Subject: [Buildroot] [git commit] package/qt5: bump version to 5.15.0
Message-ID: <20200606215024.8D2EA837FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e47ec96e80635d0b459a748a4ec3fd4eb6f24032
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

qt5declarative:
  - rebased 0002-examples-fix-parallel-install.patch

qt5tools:
  - rebased 0001-Disable-designer-tool-fixes-configure-error.patch

qt5webengine
  - 3rdparty hash update

qt5webkit-examples
  - add 0003-Fix-QPainterPath-include.patch to fix compile because
    of missing QPainterPath include

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5.mk                                 |   4 +-
 package/qt5/qt53d/qt53d.hash                       |   4 +-
 package/qt5/qt5base/qt5base.hash                   |   4 +-
 package/qt5/qt5charts/qt5charts.hash               |   4 +-
 package/qt5/qt5connectivity/qt5connectivity.hash   |   4 +-
 .../0002-examples-fix-parallel-install.patch       |  31 +-
 package/qt5/qt5declarative/qt5declarative.hash     |   4 +-
 .../qt5graphicaleffects/qt5graphicaleffects.hash   |   4 +-
 package/qt5/qt5imageformats/qt5imageformats.hash   |   4 +-
 package/qt5/qt5location/qt5location.hash           |   4 +-
 package/qt5/qt5multimedia/qt5multimedia.hash       |   4 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.hash |   4 +-
 .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |   4 +-
 package/qt5/qt5script/qt5script.hash               |   4 +-
 package/qt5/qt5scxml/qt5scxml.hash                 |   4 +-
 package/qt5/qt5sensors/qt5sensors.hash             |   4 +-
 package/qt5/qt5serialbus/qt5serialbus.hash         |   4 +-
 package/qt5/qt5serialport/qt5serialport.hash       |   4 +-
 package/qt5/qt5svg/qt5svg.hash                     |   4 +-
 ...sable-designer-tool-fixes-configure-error.patch |  12 +-
 package/qt5/qt5tools/qt5tools.hash                 |   4 +-
 .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |   4 +-
 package/qt5/qt5wayland/qt5wayland.hash             |   4 +-
 package/qt5/qt5webchannel/qt5webchannel.hash       |   4 +-
 package/qt5/qt5webengine/chromium-latest.inc       | 750 ++++++++++++++++----
 package/qt5/qt5webengine/qt5webengine.hash         | 766 ++++++++++++++++-----
 .../0003-Fix-QPainterPath-include.patch            |  36 +
 package/qt5/qt5websockets/qt5websockets.hash       |   4 +-
 package/qt5/qt5webview/qt5webview.hash             |   4 +-
 package/qt5/qt5x11extras/qt5x11extras.hash         |   4 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |   4 +-
 31 files changed, 1327 insertions(+), 372 deletions(-)

Patch is too large, so refusing to show it
