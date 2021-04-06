From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 23:39:45 +0000
Subject: [Buildroot] [PATCH v2 0/9] Bump all skarnet/s6 packages
Message-ID: <plpxZ2rQkzsU9DXh9KqBF2vdELLSLGY6sNWMqx2wKo@cp4-web-027.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This second revision now also include updates to all license files
due to year change.

Dick Olsson (9):
  package/skalibs: bump to version 2.10.0.2
  package/execline: bump to version 2.8.0.0
  package/s6: bump to version 2.10.0.2
  package/s6-portable-utils: bump to version 2.2.3.1
  package/s6-linux-utils: bump to version 2.5.1.4
  package/s6-linux-init: bump to version 1.0.6.1
  package/s6-dns: bump to version 2.3.5.0
  package/s6-networking: bump to version 2.4.1.0
  package/s6-rc: bump to version 0.5.2.1

 package/execline/execline.hash                |  4 +-
 package/execline/execline.mk                  |  2 +-
 package/s6-dns/s6-dns.hash                    |  4 +-
 package/s6-dns/s6-dns.mk                      |  2 +-
 package/s6-linux-init/s6-linux-init.hash      |  2 +-
 package/s6-linux-init/s6-linux-init.mk        |  2 +-
 package/s6-linux-utils/s6-linux-utils.hash    |  4 +-
 package/s6-linux-utils/s6-linux-utils.mk      |  2 +-
 package/s6-networking/s6-networking.hash      |  4 +-
 package/s6-networking/s6-networking.mk        |  2 +-
 .../s6-portable-utils/s6-portable-utils.hash  |  4 +-
 .../s6-portable-utils/s6-portable-utils.mk    |  2 +-
 package/s6-rc/s6-rc.hash                      |  4 +-
 package/s6-rc/s6-rc.mk                        |  2 +-
 package/s6/s6.hash                            |  4 +-
 package/s6/s6.mk                              |  2 +-
 ...ker-use-dummy-file-when-testing-libs.patch | 44 -------------------
 package/skalibs/skalibs.hash                  |  4 +-
 package/skalibs/skalibs.mk                    |  2 +-
 19 files changed, 26 insertions(+), 70 deletions(-)
 delete mode 100644 package/skalibs/0001-Make-linker-use-dummy-file-when-testing-libs.patch

-- 
2.30.2
