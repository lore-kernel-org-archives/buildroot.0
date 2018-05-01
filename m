From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  1 May 2018 21:08:51 +0200
Subject: [Buildroot] [PATCH 0/5] Bump skarnet.org packages to 2018.04
Message-ID: <20180501190856.19386-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps skarnet.org packages to 2018.04 release.

Eric Le Bihan (5):
  skalibs: bump version to 2.6.4.0
  execline: bump version to 2.5.0.0
  s6: bump version to 2.7.1.1
  s6-rc: bump version to 0.4.0.1
  s6-linux-init: bump version to 0.4.0.0

 package/execline/execline.hash                     |  2 +-
 package/execline/execline.mk                       |  2 +-
 package/s6-linux-init/s6-linux-init.hash           |  2 +-
 package/s6-linux-init/s6-linux-init.mk             |  2 +-
 package/s6-rc/s6-rc.hash                           |  2 +-
 package/s6-rc/s6-rc.mk                             |  2 +-
 package/s6/s6.hash                                 |  2 +-
 package/s6/s6.mk                                   |  2 +-
 .../0002-No-runtime-tests-for-type-sizes.patch     | 40 +++++++++++++---------
 package/skalibs/skalibs.hash                       |  2 +-
 package/skalibs/skalibs.mk                         |  2 +-
 11 files changed, 33 insertions(+), 27 deletions(-)

--
2.14.3
