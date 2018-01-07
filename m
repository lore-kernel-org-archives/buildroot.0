From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  7 Jan 2018 20:08:44 +0100
Subject: [Buildroot] [PATCH 0/9] Bump skarnet.org packages to 2018.01
Message-ID: <20180107190853.15382-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps skarnet.org packages to 2018.01 release and add license
hashes.

Eric Le Bihan (9):
  skalibs: bump version to 2.6.3.0
  s6: bump version to 2.7.0.0
  s6-rc: bump version to 0.4.0.0
  s6-dns: bump version to 2.3.0.0
  execline: add license hash
  s6-linux-init: add license hash
  s6-networking: add license hash
  s6-portable-utils: add license hash
  s6-linux-utils: add license hash

 package/execline/execline.hash                   | 1 +
 package/s6-dns/s6-dns.hash                       | 3 ++-
 package/s6-dns/s6-dns.mk                         | 2 +-
 package/s6-linux-init/s6-linux-init.hash         | 1 +
 package/s6-linux-utils/s6-linux-utils.hash       | 1 +
 package/s6-networking/s6-networking.hash         | 1 +
 package/s6-portable-utils/s6-portable-utils.hash | 1 +
 package/s6-rc/s6-rc.hash                         | 3 ++-
 package/s6-rc/s6-rc.mk                           | 2 +-
 package/s6/s6.hash                               | 3 ++-
 package/s6/s6.mk                                 | 2 +-
 package/skalibs/skalibs.hash                     | 3 ++-
 package/skalibs/skalibs.mk                       | 2 +-
 13 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.14.3
