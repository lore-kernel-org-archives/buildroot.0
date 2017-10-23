From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 23 Oct 2017 21:51:59 +0200
Subject: [Buildroot] [PATCH 0/4] Bump skarnet.org packages to 2017.10
Message-ID: <20171023195203.6775-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps all skarnet.org packages updated in release 2017.10.

Eric Le Bihan (4):
  skalibs: bump version to 2.6.0.1
  execline: bump version to 2.3.0.3
  s6: bump version to 2.6.1.1
  s6-rc: bump version to 0.3.0.0

 package/execline/execline.hash                     |  2 +-
 package/execline/execline.mk                       |  2 +-
 package/s6-rc/s6-rc.hash                           |  2 +-
 package/s6-rc/s6-rc.mk                             |  2 +-
 package/s6/s6.hash                                 |  2 +-
 package/s6/s6.mk                                   |  2 +-
 .../0001-No-runtime-tests-for-endianness.patch     | 24 ++++++++++------------
 .../0002-No-runtime-tests-for-type-sizes.patch     | 18 ++++++++--------
 ...e-linker-use-dummy-file-when-testing-libs.patch | 18 ++++++++--------
 package/skalibs/skalibs.hash                       |  2 +-
 package/skalibs/skalibs.mk                         |  2 +-
 11 files changed, 37 insertions(+), 39 deletions(-)

--
2.13.6
