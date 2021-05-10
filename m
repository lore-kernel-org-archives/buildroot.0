From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 10 May 2021 11:27:24 +0200
Subject: [Buildroot] [PATCH 0/2] package/lvm2: fix source link and bump
 version to 2.03.12
Message-ID: <20210510092726.1479608-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin Niestroj (2):
  package/lvm2: use http instead of ftp
  package/lvm2: bump version to 2.03.12

 ...gure-Introduce-enable-symvers-option.patch | 278 ------------------
 ...supported-options-event-timeout-rule.patch |  33 ---
 package/lvm2/lvm2.hash                        |   4 +-
 package/lvm2/lvm2.mk                          |   6 +-
 4 files changed, 5 insertions(+), 316 deletions(-)
 delete mode 100644 package/lvm2/0001-configure-Introduce-enable-symvers-option.patch
 delete mode 100644 package/lvm2/0002-udev-remove-unsupported-options-event-timeout-rule.patch

-- 
2.31.1
