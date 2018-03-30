From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Mar 2018 11:17:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.3.1
Message-ID: <20180330091739.27675-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 438c3cccef..cd2a0809fe 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 cce15db2fc5233386b63a3cf21c465c09e6e55014ed66c4f184b7d221a47180c  dovecot-2.2.35.tar.gz
+sha256 0883821b97fd02a084a84b9469a681f7e6edc56541d854b5419d98891c51fb93  dovecot-2.3.1.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 783ca06a0e..8e775be5f7 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).35
+DOVECOT_VERSION_MAJOR = 2.3
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).1
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
-- 
2.14.2
