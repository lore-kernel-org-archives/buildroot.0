From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 25 Jun 2017 21:26:12 +0200
Subject: [Buildroot] [PATCH 0/9] Bump skarnet.org packages to spring release
Message-ID: <20170625192621.24188-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

This patch series bumps the skarnet.org packages to the spring release
([1],[2])

[1] http://www.mail-archive.com/skaware at list.skarnet.org/msg00962.html
[2] http://www.mail-archive.com/skaware at list.skarnet.org/msg00999.html

Eric Le Bihan (9):
  skalibs: bump version to 2.5.1.1
  execline: bump version to 2.3.0.1
  s6-dns: bump version to 2.2.0.0
  s6-networking: bump version to 2.3.0.1
  s6: bump version to 2.6.0.0
  s6-rc: bump version to 0.2.0.1
  s6-linux-utils: bump version to 2.4.0.0
  s6-portable-utils: bump version to 2.2.1.0
  s6-linux-init: bump version to 0.3.0.0

 package/execline/execline.hash                     |  2 +-
 package/execline/execline.mk                       |  2 +-
 package/s6-dns/s6-dns.hash                         |  2 +-
 package/s6-dns/s6-dns.mk                           |  2 +-
 package/s6-linux-init/s6-linux-init.hash           |  2 +-
 package/s6-linux-init/s6-linux-init.mk             |  2 +-
 package/s6-linux-utils/s6-linux-utils.hash         |  2 +-
 package/s6-linux-utils/s6-linux-utils.mk           |  2 +-
 package/s6-networking/s6-networking.hash           |  2 +-
 package/s6-networking/s6-networking.mk             |  2 +-
 package/s6-portable-utils/s6-portable-utils.hash   |  2 +-
 package/s6-portable-utils/s6-portable-utils.mk     |  2 +-
 package/s6-rc/s6-rc.hash                           |  2 +-
 package/s6-rc/s6-rc.mk                             |  2 +-
 package/s6/s6.hash                                 |  2 +-
 package/s6/s6.mk                                   |  2 +-
 .../0001-No-runtime-tests-for-endianness.patch     | 14 ++--
 .../0002-No-runtime-tests-for-type-sizes.patch     | 98 +++++++++++++++++-----
 ...e-linker-use-dummy-file-when-testing-libs.patch | 10 +--
 package/skalibs/skalibs.hash                       |  2 +-
 package/skalibs/skalibs.mk                         |  2 +-
 21 files changed, 106 insertions(+), 52 deletions(-)

-- 
2.9.4
