From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jul 2020 21:57:08 +0200
Subject: [Buildroot] [git commit] package/gloox: bump version to 1.0.24
Message-ID: <20200723195951.7D39088330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=525445f3c8c3e5a75ade56a16a440b33d1e8f320
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yair Ben Avraham <yairba@protonmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gloox/gloox.hash | 2 +-
 package/gloox/gloox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gloox/gloox.hash b/package/gloox/gloox.hash
index ee42c079b2..6419db90f8 100644
--- a/package/gloox/gloox.hash
+++ b/package/gloox/gloox.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  97cb6a0c07e320ffa4a7c66e8ab06b2361086271dc87ed2398befef4e8435f8a  gloox-1.0.23.tar.bz2
+sha256  ae1462be2a2eb8fe5cd054825143617c53c2c9c7195606cb5a5ba68c0f68f9c9  gloox-1.0.24.tar.bz2
 sha256  40a20c41c8dabb8ba61bea983fa8f2f6989e67fac56bb62c2249053807fd26af  LICENSE
diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
index f643118198..b741d5ebc1 100644
--- a/package/gloox/gloox.mk
+++ b/package/gloox/gloox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLOOX_VERSION = 1.0.23
+GLOOX_VERSION = 1.0.24
 GLOOX_SOURCE = gloox-$(GLOOX_VERSION).tar.bz2
 GLOOX_SITE = https://camaya.net/download
 GLOOX_LICENSE = GPL-3.0 with OpenSSL exception
