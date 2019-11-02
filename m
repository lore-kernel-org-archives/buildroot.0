From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 22:31:59 +0100
Subject: [Buildroot] [PATCH 0/9] Bump skarnet packages to 2019.10 release
Message-ID: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps the skarnet.org packages to 2019.10 release [1].

[1] https://www.mail-archive.com/skaware at list.skarnet.org/msg01377.html

Eric Le Bihan (9):
  package/skalibs: bump version to 2.9.1.0
  package/execline: bump version to 2.5.3.0
  package/s6: bump version to 2.9.0.1
  package/s6-rc: bump version to 0.5.1.1
  package/s6-linux-init: bump version to 1.0.3.1
  package/s6-dns: bump version to 2.3.1.1
  package/s6-networking: bump version to 2.3.1.1
  package/s6-portable-utils: bump version to 2.2.2.1
  package/s6-linux-utils: bump version to 2.5.1.1

 package/execline/execline.hash                   | 2 +-
 package/execline/execline.mk                     | 2 +-
 package/s6-dns/s6-dns.hash                       | 2 +-
 package/s6-dns/s6-dns.mk                         | 2 +-
 package/s6-linux-init/s6-linux-init.hash         | 2 +-
 package/s6-linux-init/s6-linux-init.mk           | 2 +-
 package/s6-linux-utils/s6-linux-utils.hash       | 2 +-
 package/s6-linux-utils/s6-linux-utils.mk         | 2 +-
 package/s6-networking/s6-networking.hash         | 2 +-
 package/s6-networking/s6-networking.mk           | 2 +-
 package/s6-portable-utils/s6-portable-utils.hash | 2 +-
 package/s6-portable-utils/s6-portable-utils.mk   | 2 +-
 package/s6-rc/s6-rc.hash                         | 2 +-
 package/s6-rc/s6-rc.mk                           | 2 +-
 package/s6/s6.hash                               | 2 +-
 package/s6/s6.mk                                 | 2 +-
 package/skalibs/skalibs.hash                     | 2 +-
 package/skalibs/skalibs.mk                       | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

--
2.21.0
