From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  9 Jul 2018 19:18:02 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/1=5D_=C3=82package/dovecot=3A_b?=
 =?utf-8?q?ump_version_to_2=2E3=2E2=2E1?=
Message-ID: <20180709171802.8791-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot/dovecot.hash | 2 +-
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 46774e0d2e..857c976a8f 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-sha256 6e48f0fa60768427f03035b0a3e93d1ae29b972bb2bd9ca998ccc6a0f6dae393  dovecot-2.3.2.tar.gz
+sha256 4a65118508dc7a562e5f90dd7c3f56219fff22367c496f17d77cd0c7e2724e34  dovecot-2.3.2.1.tar.gz
 sha256 a363b132e494f662d98c820d1481297e6ae72f194c2c91b6c39e1518b86240a8  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256 52b8c95fabb19575281874b661ef7968ea47e8f5d74ba0dd40ce512e52b3fc97  COPYING.MIT
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 3923ee9e05..c93d4ff4a3 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.3
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).2
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).2.1
 DOVECOT_SITE = https://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPL-2.1, MIT, Public Domain, BSD-3-Clause, Unicode-DFS-2015
-- 
2.18.0
