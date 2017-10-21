From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 09:59:43 +0200
Subject: [Buildroot] [PATCH v1] qt5: bump LTS version to 5.6.3
In-Reply-To: <20171020184110.13216-1-ps.report@gmx.net>
References: <20171020184110.13216-1-ps.report@gmx.net>
Message-ID: <20171021095943.790be9b6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 20 Oct 2017 20:41:10 +0200, Peter Seiderer wrote:
> qt5base:
>   - move hash file to 5.6.3
>   - move 0001-eglfs-rasp-pi-header-inclusion.patch to 5.6.3
>   - remove 0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch (upstream committed [1])
> 
> qt5declarative:
>   - move patches to 5.6.3
> 
> qt5quickcontrols2:
>   - move hash file to 5.6.3
> 
> qt5webkit:
>   - move patches to 5.6.3
> 
> [1] http://code.qt.io/cgit/qt/qtbase.git/commit/?h=5.6&id=f1b4bd4790860e1ff5afcec111a359bc3a91cfda
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5.mk                                 |  2 +-
>  package/qt5/qt53d/qt53d.hash                       |  4 +-
>  ...fs-fix-eglfs_mali-compile-for-odroid-mali.patch | 53 ----------------------
>  .../0001-eglfs-rasp-pi-header-inclusion.patch      |  0
>  package/qt5/qt5base/{5.6.2 => 5.6.3}/qt5base.hash  |  0
>  package/qt5/qt5base/qt5base.hash                   |  4 +-
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +-
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +-
>  ...xamples-photoviewer-needs-widgets-support.patch |  0
>  ...uickviewcomparison-and-quickwidget-needs-.patch |  0
>  package/qt5/qt5declarative/qt5declarative.hash     |  4 +-
>  package/qt5/qt5enginio/qt5enginio.hash             |  2 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  4 +-
>  package/qt5/qt5location/qt5location.hash           |  4 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  4 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  4 +-
>  .../{5.6.2 => 5.6.3}/qt5quickcontrols2.hash        |  0
>  .../qt5/qt5quickcontrols2/qt5quickcontrols2.hash   |  4 +-
>  package/qt5/qt5script/qt5script.hash               |  4 +-
>  package/qt5/qt5sensors/qt5sensors.hash             |  4 +-
>  package/qt5/qt5serialbus/qt5serialbus.hash         |  4 +-
>  package/qt5/qt5serialport/qt5serialport.hash       |  4 +-
>  package/qt5/qt5svg/qt5svg.hash                     |  4 +-
>  package/qt5/qt5tools/qt5tools.hash                 |  4 +-
>  package/qt5/qt5wayland/qt5wayland.hash             |  4 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +-
>  .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  0
>  .../0002-Remove-TEXTREL-tag-in-x86.patch           |  0
>  ...ude-backtrace-API-for-non-glibc-libraries.patch |  0
>  package/qt5/qt5webkit/qt5webkit.hash               |  4 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |  4 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +-
>  34 files changed, 48 insertions(+), 101 deletions(-)
>  delete mode 100644 package/qt5/qt5base/5.6.2/0002-eglfs-fix-eglfs_mali-compile-for-odroid-mali.patch
>  rename package/qt5/qt5base/{5.6.2 => 5.6.3}/0001-eglfs-rasp-pi-header-inclusion.patch (100%)
>  rename package/qt5/qt5base/{5.6.2 => 5.6.3}/qt5base.hash (100%)
>  rename package/qt5/qt5declarative/{5.6.2 => 5.6.3}/0001-examples-photoviewer-needs-widgets-support.patch (100%)
>  rename package/qt5/qt5declarative/{5.6.2 => 5.6.3}/0002-examples-qquickviewcomparison-and-quickwidget-needs-.patch (100%)
>  rename package/qt5/qt5quickcontrols2/{5.6.2 => 5.6.3}/qt5quickcontrols2.hash (100%)
>  rename package/qt5/qt5webkit/{5.6.2 => 5.6.3}/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch (100%)
>  rename package/qt5/qt5webkit/{5.6.2 => 5.6.3}/0002-Remove-TEXTREL-tag-in-x86.patch (100%)
>  rename package/qt5/qt5webkit/{5.6.2 => 5.6.3}/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
