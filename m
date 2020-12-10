From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Dec 2020 22:11:39 +0100
Subject: [Buildroot] [PATCH v1 01/31] package/qt5: bump version to 5.15.2
In-Reply-To: <20201121211258.12068-1-ps.report@gmx.net>
References: <20201121211258.12068-1-ps.report@gmx.net>
Message-ID: <20201210221139.1acc49ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 21 Nov 2020 22:12:28 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> qt5base:
>   - header.BSD was remove with commit 'Remove license header
>     templates from qtbase' ([1])
> 
> qt5tools:
>   - rebase 0001-Disable-designer-tool-fixes-configure-error.patch
> 
> qt5webengine:
>   - update 3rdparty license info
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=9ac8b9c92eb01bf755995669ecd7ab3acf21dd7d
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5.mk                            |   2 +-
>  package/qt5/qt53d/qt53d.hash                  |   4 +-
>  package/qt5/qt5base/qt5base.hash              |   5 +-
>  package/qt5/qt5base/qt5base.mk                |   1 -
>  package/qt5/qt5charts/qt5charts.hash          |   4 +-
>  .../qt5/qt5connectivity/qt5connectivity.hash  |   4 +-
>  .../qt5/qt5declarative/qt5declarative.hash    |   4 +-
>  .../qt5graphicaleffects.hash                  |   4 +-
>  .../qt5/qt5imageformats/qt5imageformats.hash  |   4 +-
>  package/qt5/qt5location/qt5location.hash      |   4 +-
>  package/qt5/qt5lottie/qt5lottie.hash          |   4 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash  |   4 +-
>  .../qt5quickcontrols/qt5quickcontrols.hash    |   4 +-
>  .../qt5quickcontrols2/qt5quickcontrols2.hash  |   4 +-
>  .../qt5quicktimeline/qt5quicktimeline.hash    |   4 +-
>  .../qt5remoteobjects/qt5remoteobjects.hash    |   4 +-
>  package/qt5/qt5script/qt5script.hash          |   4 +-
>  package/qt5/qt5scxml/qt5scxml.hash            |   4 +-
>  package/qt5/qt5sensors/qt5sensors.hash        |   4 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash    |   4 +-
>  package/qt5/qt5serialport/qt5serialport.hash  |   4 +-
>  package/qt5/qt5svg/qt5svg.hash                |   4 +-
>  ...-designer-tool-fixes-configure-error.patch |  10 +-
>  package/qt5/qt5tools/qt5tools.hash            |   4 +-
>  .../qt5virtualkeyboard.hash                   |   4 +-
>  package/qt5/qt5wayland/qt5wayland.hash        |   4 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash  |   4 +-
>  package/qt5/qt5webengine/chromium-latest.inc  | 116 ++++++++++------
>  package/qt5/qt5webengine/qt5webengine.hash    | 126 ++++++++++++------
>  package/qt5/qt5websockets/qt5websockets.hash  |   4 +-
>  package/qt5/qt5webview/qt5webview.hash        |   4 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash    |   4 +-
>  .../qt5/qt5xmlpatterns/qt5xmlpatterns.hash    |   4 +-
>  33 files changed, 222 insertions(+), 146 deletions(-)

Applied to master, thanks. I'm of course waiting for the remaining
patches ! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
