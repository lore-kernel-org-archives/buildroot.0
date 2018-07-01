From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Jul 2018 14:55:14 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot: bump version to 2.3.2
In-Reply-To: <20180701125514.28232-1-bernd.kuhls@t-online.de>
References: <20180701125514.28232-1-bernd.kuhls@t-online.de>
Message-ID: <20180701125514.28232-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https.

Release notes:
https://www.dovecot.org/list/dovecot-news/2018-June/000383.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index cd2a0809fe..46774e0d2e 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 0883821b97fd02a084a84b9469a681f7e6edc56541d854b5419d98891c51fb93  dovecot-2.3.1.tar.gz
+sha256 6e48f0fa60768427f03035b0a3e93d1ae29b972bb2bd9ca998ccc6a0f6dae393  dovecot-2.3.2.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 1a10b30e16..3923ee9e05 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).1
-DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).2
+DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
 DOVECOT_LICENSE_FILES = COPYING COPYING.LGPL COPYING.MIT
-- 
2.17.1
