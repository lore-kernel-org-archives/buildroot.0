From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:51:21 +0200
Subject: [Buildroot] [PATCH for-next v1] package/qt5: bump version to
 5.15.0
In-Reply-To: <20200528221411.31473-1-ps.report@gmx.net>
References: <20200528221411.31473-1-ps.report@gmx.net>
Message-ID: <20200606235121.318413d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 29 May 2020 00:14:11 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> qt5declarative:
>   - rebased 0002-examples-fix-parallel-install.patch
> 
> qt5tools:
>   - rebased 0001-Disable-designer-tool-fixes-configure-error.patch
> 
> qt5webengine
>   - 3rdparty hash update
> 
> qt5webkit-examples
>   - add 0003-Fix-QPainterPath-include.patch to fix compile because
>     of missing QPainterPath include
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5.mk                            |   4 +-
>  package/qt5/qt53d/qt53d.hash                  |   4 +-
>  package/qt5/qt5base/qt5base.hash              |   4 +-
>  package/qt5/qt5charts/qt5charts.hash          |   4 +-
>  .../qt5/qt5connectivity/qt5connectivity.hash  |   4 +-
>  .../0002-examples-fix-parallel-install.patch  |  31 +-
>  .../qt5/qt5declarative/qt5declarative.hash    |   4 +-
>  .../qt5graphicaleffects.hash                  |   4 +-
>  .../qt5/qt5imageformats/qt5imageformats.hash  |   4 +-
>  package/qt5/qt5location/qt5location.hash      |   4 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash  |   4 +-
>  .../qt5quickcontrols/qt5quickcontrols.hash    |   4 +-
>  .../qt5quickcontrols2/qt5quickcontrols2.hash  |   4 +-
>  package/qt5/qt5script/qt5script.hash          |   4 +-
>  package/qt5/qt5scxml/qt5scxml.hash            |   4 +-
>  package/qt5/qt5sensors/qt5sensors.hash        |   4 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash    |   4 +-
>  package/qt5/qt5serialport/qt5serialport.hash  |   4 +-
>  package/qt5/qt5svg/qt5svg.hash                |   4 +-
>  ...-designer-tool-fixes-configure-error.patch |  12 +-
>  package/qt5/qt5tools/qt5tools.hash            |   4 +-
>  .../qt5virtualkeyboard.hash                   |   4 +-
>  package/qt5/qt5wayland/qt5wayland.hash        |   4 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash  |   4 +-
>  package/qt5/qt5webengine/chromium-latest.inc  | 750 +++++++++++++----
>  package/qt5/qt5webengine/qt5webengine.hash    | 766 ++++++++++++++----
>  .../0003-Fix-QPainterPath-include.patch       |  36 +
>  package/qt5/qt5websockets/qt5websockets.hash  |   4 +-
>  package/qt5/qt5webview/qt5webview.hash        |   4 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash    |   4 +-
>  .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   4 +-
>  31 files changed, 1327 insertions(+), 372 deletions(-)
>  create mode 100644 package/qt5/qt5webkit-examples/0003-Fix-QPainterPath-include.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
