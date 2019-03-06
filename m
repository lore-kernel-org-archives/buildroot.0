From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 Mar 2019 18:24:21 +0100
Subject: [Buildroot] [PATCH 1/2] package/dovecot: bump version to 2.3.5
Message-ID: <20190306172422.7238-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.dovecot.org/list/dovecot-news/2019-March/000399.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index e4a07ba4e4..a37cc68cf6 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 b8873e2ce5c33e58963bb7a8d2ff8427c09dbfdd63e13a0b0f4502864043aa07  dovecot-2.3.4.1.tar.gz
+sha256 bfe112ec6d11f7d6c6f7f0440e3b6e2c840c15cec1e99466b5495765d54aaaff  dovecot-2.3.5.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index bffc8ac54f..0960d20da7 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).4.1
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).5
 DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
-- 
2.20.1
