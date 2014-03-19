From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Mar 2014 20:30:05 +0100
Subject: [Buildroot] [PATCH 0 of 4] qt packages: make sure PATH is set
 during make and qmake
Message-ID: <patchbomb.1395257405@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Following a build error reported by Marco Trapanese, this patch series makes
sure that PATH is set correctly during calls to make/qmake of qt packages.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/qextserialport/qextserialport.mk               |  4 ++--
 package/qt5/qt5connectivity/qt5connectivity.mk         |  2 +-
 package/qt5/qt5declarative/qt5declarative.mk           |  2 +-
 package/qt5/qt5graphicaleffects/qt5graphicaleffects.mk |  2 +-
 package/qt5/qt5imageformats/qt5imageformats.mk         |  2 +-
 package/qt5/qt5multimedia/qt5multimedia.mk             |  2 +-
 package/qt5/qt5quick1/qt5quick1.mk                     |  2 +-
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk       |  2 +-
 package/qt5/qt5script/qt5script.mk                     |  2 +-
 package/qt5/qt5sensors/qt5sensors.mk                   |  2 +-
 package/qt5/qt5serialport/qt5serialport.mk             |  2 +-
 package/qt5/qt5svg/qt5svg.mk                           |  2 +-
 package/qt5/qt5x11extras/qt5x11extras.mk               |  2 +-
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk           |  2 +-
 package/qtuio/qtuio.mk                                 |  6 +++---
 package/qwt/qwt.mk                                     |  4 ++--
 16 files changed, 20 insertions(+), 20 deletions(-)
