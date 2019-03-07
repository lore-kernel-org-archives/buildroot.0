From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 22:01:49 +0100
Subject: [Buildroot] [git commit] package/dovecot: bump version to 2.3.5
Message-ID: <20190307205959.D36808E90A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b404245d6f09a45c53c0d81b57a84376f72ef770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.dovecot.org/list/dovecot-news/2019-March/000399.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
