From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sat, 30 Jun 2018 00:25:49 +0200
Subject: [Buildroot] [PATCH 0/3] Bump and various improvements to systemd
Message-ID: <20180629222552.12808-1-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump systemd to latest release, then fix various minor issues

J?r?my Rosen (3):
  systemd: bump to v239
  systemd: add support for PCRE2
  systemd: fix nogroup

 package/systemd/0001-fix-getty-unit.patch     |  61 ++++--
 .../0002-install-don-t-use-ln-relative.patch  |  19 +-
 ...-include-libmount-h-in-a-header-file.patch |  75 -------
 .../0005-basic-macros-rename-noreturn.patch   | 201 ------------------
 package/systemd/systemd.hash                  |   2 +-
 package/systemd/systemd.mk                    |  12 +-
 6 files changed, 72 insertions(+), 298 deletions(-)
 delete mode 100644 package/systemd/0004-core-dont-include-libmount-h-in-a-header-file.patch
 delete mode 100644 package/systemd/0005-basic-macros-rename-noreturn.patch

-- 
2.18.0
