From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Feb 2016 23:45:16 +0100
Subject: [Buildroot] [PATCH v1] qt5: bump version to 5.5.1
In-Reply-To: <1454536883-5029-1-git-send-email-ps.report@gmx.net>
References: <1454536883-5029-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160203234516.1d9e0291@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed,  3 Feb 2016 23:01:23 +0100, Peter Seiderer wrote:
> Reduce hash lists to strongest only (sha256).
> 
> Remove upstream committed patches (qt5base):
>  - 0004-no-gold-linker-for-host-build.patch (see [1], [2])
>  - 0007-big_endian-fix_destformat.patch (see [3])
>  - 0008-QtGui-force-image-dir-in-include_path.patch (see [4], [5])
> 
> [1] https://bugreports.qt.io/browse/QTBUG-46125
> [2] https://codereview.qt-project.org/#/c/113563/
> [3] https://codereview.qt-project.org/#/c/120654/
> [4] https://bugreports.qt.io/browse/QTBUG-47400
> [5] https://codereview.qt-project.org/#/c/122145/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Note: updates new qt5tools package too.
> ---
>  package/qt5/qt5.mk                                 |  2 +-
>  package/qt5/qt53d/qt53d.hash                       |  4 +-
>  .../0004-no-gold-linker-for-host-build.patch       | 41 ----------
>  .../qt5base/0007-big_endian-fix_destformat.patch   | 34 ---------
>  ...008-QtGui-force-image-dir-in-include_path.patch | 89 ----------------------
>  package/qt5/qt5base/qt5base.hash                   |  6 +-
>  package/qt5/qt5connectivity/qt5connectivity.hash   |  6 +-
>  package/qt5/qt5declarative/qt5declarative.hash     |  6 +-
>  package/qt5/qt5enginio/qt5enginio.hash             |  6 +-
>  .../qt5graphicaleffects/qt5graphicaleffects.hash   |  6 +-
>  package/qt5/qt5imageformats/qt5imageformats.hash   |  6 +-
>  package/qt5/qt5multimedia/qt5multimedia.hash       |  6 +-
>  package/qt5/qt5quick1/qt5quick1.hash               |  6 +-
>  package/qt5/qt5quickcontrols/qt5quickcontrols.hash |  6 +-
>  package/qt5/qt5script/qt5script.hash               |  6 +-
>  package/qt5/qt5sensors/qt5sensors.hash             |  6 +-
>  package/qt5/qt5serialport/qt5serialport.hash       |  6 +-
>  package/qt5/qt5svg/qt5svg.hash                     |  6 +-
>  package/qt5/qt5tools/qt5tools.hash                 |  6 +-
>  package/qt5/qt5webchannel/qt5webchannel.hash       |  6 +-
>  .../qt5/qt5webkit-examples/qt5webkit-examples.hash |  6 +-
>  package/qt5/qt5webkit/qt5webkit.hash               |  6 +-
>  package/qt5/qt5websockets/qt5websockets.hash       |  6 +-
>  package/qt5/qt5x11extras/qt5x11extras.hash         |  6 +-
>  package/qt5/qt5xmlpatterns/qt5xmlpatterns.hash     |  6 +-
>  25 files changed, 43 insertions(+), 247 deletions(-)
>  delete mode 100644 package/qt5/qt5base/0004-no-gold-linker-for-host-build.patch
>  delete mode 100644 package/qt5/qt5base/0007-big_endian-fix_destformat.patch
>  delete mode 100644 package/qt5/qt5base/0008-QtGui-force-image-dir-in-include_path.patch

Applied, after removing the chunk related to qt5tools, since it hasn't
been merged yet.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
