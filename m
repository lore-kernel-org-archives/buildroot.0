From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Jun 2016 15:42:06 +0200
Subject: [Buildroot] [PATCH v2] qt5: bump version to 5.6.1-1
In-Reply-To: <1466801021-32264-1-git-send-email-ps.report@gmx.net>
References: <1466801021-32264-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160625154206.6b576d3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Jun 2016 22:43:41 +0200, Peter Seiderer wrote:
> Removed obsolete patches:
> 
>   - qt5base/0001-Disable-c-standard-compiler-flags-for-the-host-build.patch (upstream committed [1])
>   - qt5base: https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f15d404930a56066.patch (upstream committed)
>   - qt5/qt5base/0007-build-with-explicitlib-after-all.patch (upstream committed [2])
>   - qt5tools/0001-Disable-qdoc-needs-qtdeclarative.patch (fixed upstream by [3])
>   - qt5webkit/0004-Fix-linking-with-libpthread.patch (upstream committed [4])
> 
> [1] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=e69e69519661954716d59bfa5bbd0626515cfda9
> [2] http://code.qt.io/cgit/qt/qtbase.git/commit/?id=523c7e3fd55c853dd424d57f28e225d57439cf89
> [3] http://code.qt.io/cgit/qt/qttools.git/commit/?id=2b262fad86ef38a5fa692b4c73e6ec26a5d45a5f
> [4] http://code.qt.io/cgit/qt/qtwebkit.git/commit/?id=5f359baacdf92fabcece83f0a2b30f74c7c02a3c
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 --> v2:
>   - add obsolete patch entry for qt5base.mk downloaded patch
>   - fix qt5enginio version (is 1.6.1 for qt5.6.1-1)
> ---
>  package/qt5/qt5.mk                                 |  2 +-
>  package/qt5/qt53d/qt53d.hash                       |  4 +-
>  ...tandard-compiler-flags-for-the-host-build.patch | 44 -------------------
>  .../0007-build-with-explicitlib-after-all.patch    | 51 ----------------------
>  package/qt5/qt5base/qt5base.hash                   |  5 +--
>  package/qt5/qt5base/qt5base.mk                     |  1 -
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
>  package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
>  package/qt5/qt5enginio/qt5enginio.hash             |  4 +-
>  package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
>  package/qt5/qt5location/qt5location.hash           |  4 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
>  package/qt5/qt5script/qt5script.hash               |  4 +-
>  package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
>  package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
>  package/qt5/qt5svg/qt5svg.hash                     |  4 +-
>  .../0001-Disable-qdoc-needs-qtdeclarative.patch    | 30 -------------
>  package/qt5/qt5tools/qt5tools.hash                 |  4 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
>  .../0004-Fix-linking-with-libpthread.patch         | 34 ---------------
>  package/qt5/qt5webkit/qt5webkit.hash               |  2 +-
>  package/qt5/qt5webkit/qt5webkit.mk                 |  2 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
>  31 files changed, 48 insertions(+), 209 deletions(-)
>  delete mode 100644 package/qt5/qt5base/0001-Disable-c-standard-compiler-flags-for-the-host-build.patch
>  delete mode 100644 package/qt5/qt5base/0007-build-with-explicitlib-after-all.patch
>  delete mode 100644 package/qt5/qt5tools/0001-Disable-qdoc-needs-qtdeclarative.patch
>  delete mode 100644 package/qt5/qt5webkit/0004-Fix-linking-with-libpthread.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
