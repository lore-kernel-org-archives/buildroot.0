From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 22:51:32 +0200
Subject: [Buildroot] [PATCH v1] qt5: bump version to 5.6.2
In-Reply-To: <1476552497-21735-1-git-send-email-ps.report@gmx.net>
References: <1476552497-21735-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161015225132.73d52dda@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Oct 2016 19:28:17 +0200, Peter Seiderer wrote:
> - qt5base: remove obsolete '-no-nis' configure parameter ([1])
> - qt5base: remove  upstream committed patch 0007-Remove-libudev-dependency-from-kms.pro.patch ([2])
> - qt5imageformats: remove upstream committed  patch 0001-tvOS-support.patch ([3])
> 
> [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=644d0e75240811212ed9fd0c21e3bd05db3ba5db
> [2] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=72492735b7b7770808fcc9fe067e8f03fab827fc
> [3] https://git.buildroot.net/buildroot/commit/package/qt5?id=9a55b996651fdfbc40e202cb4dd725dce624ca91
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5.mk                                 |  2 +-
>  package/qt5/qt53d/qt53d.hash                       |  4 +--
>  ...07-Remove-libudev-dependency-from-kms.pro.patch | 33 --------------------
>  package/qt5/qt5base/qt5base.hash                   |  4 +--
>  package/qt5/qt5base/qt5base.mk                     |  1 -
>  package/qt5/qt5canvas3d/qt5canvas3d.hash           |  4 +--
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  4 +--
>  package/qt5/qt5declarative/qt5declarative.hash     |  4 +--
>  package/qt5/qt5enginio/qt5enginio.hash             |  4 +--
>  package/qt5/qt5enginio/qt5enginio.mk               |  2 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  4 +--
>  .../qt5/qt5imageformats/0001-tvOS-support.patch    | 35 ----------------------
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
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  4 +--
>  package/qt5/qt5webkit/qt5webkit.hash               |  2 +-
>  package/qt5/qt5webkit/qt5webkit.mk                 |  2 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |  4 +--
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  4 +--
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  4 +--
>  29 files changed, 48 insertions(+), 117 deletions(-)
>  delete mode 100644 package/qt5/qt5base/0007-Remove-libudev-dependency-from-kms.pro.patch
>  delete mode 100644 package/qt5/qt5imageformats/0001-tvOS-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
