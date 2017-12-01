From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:03:55 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump latest version to 5.9.3
In-Reply-To: <20171128223744.28422-1-ps.report@gmx.net>
References: <20171128223744.28422-1-ps.report@gmx.net>
Message-ID: <20171201230355.56986fd9@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Nov 2017 23:37:44 +0100, Peter Seiderer wrote:
> qt5connectivity:
>  - moved 0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch
>    to 5.9.3
> 
> qt5declarative:
>  - removed 0001-Fix-no-opengl-builds.patch to 5.9.3 (upstream committed,
>    see [1])
> 
> qt5webengine:
>  - keep 0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch
>    (upstream committed, see [2], but reverted afterwards, see [3])
> 
> [1] https://code.qt.io/cgit/qt/qtdeclarative.git/commit/?id=fa52bb665d6beb77a951c14c8edcba3541850afc
> [2] https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=d4c621f6a6b87f2a86069fa393b9f7c4f9e7b9ad
> [3] https://code.qt.io/cgit/qt/qtwebengine.git/commit/?id=c11c2c8981e647c1eb2c6753ce77d436b92fff87
> ---
>  package/qt5/qt5.mk                                 |  2 +-
>  package/qt5/qt53d/qt53d.hash                       |  4 +--
>  package/qt5/qt5base/qt5base.hash                   |  4 +--
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +--
>  ...rtrate-server-needs-only-core-and-bluetoo.patch |  0
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +--
>  .../5.9.2/0001-Fix-no-opengl-builds.patch          | 32 ----------------------
>  package/qt5/qt5declarative/qt5declarative.hash     |  4 +--
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +--
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +--
>  package/qt5/qt5location/qt5location.hash           |  4 +--
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +--
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +--
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +--
>  package/qt5/qt5script/qt5script.hash               |  4 +--
>  package/qt5/qt5sensors/qt5sensors.hash             |  4 +--
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +--
>  package/qt5/qt5serialport/qt5serialport.hash       |  4 +--
>  package/qt5/qt5svg/qt5svg.hash                     |  4 +--
>  package/qt5/qt5tools/qt5tools.hash                 |  4 +--
>  .../qt5/qt5virtualkeyboard/qt5virtualkeyboard.hash |  4 +--
>  package/qt5/qt5wayland/qt5wayland.hash             |  4 +--
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +--
>  ...ad-libEGL-and-libGLES2-symbols-implicitly.patch |  0
>  package/qt5/qt5webengine/qt5webengine.hash         |  4 +--
>  package/qt5/qt5websockets/qt5websockets.hash       |  4 +--
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +--
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +--
>  28 files changed, 49 insertions(+), 81 deletions(-)
>  rename package/qt5/qt5connectivity/{5.9.2 => 5.9.3}/0001-Example-heartrate-server-needs-only-core-and-bluetoo.patch (100%)
>  delete mode 100644 package/qt5/qt5declarative/5.9.2/0001-Fix-no-opengl-builds.patch
>  rename package/qt5/qt5webengine/{5.9.2 => 5.9.3}/0002-Load-libEGL-and-libGLES2-symbols-implicitly.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
