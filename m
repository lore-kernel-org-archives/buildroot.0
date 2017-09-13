From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 11:38:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/ndisc6: bump version to 1.0.3
Message-ID: <20170913093823.12516-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ndisc6/ndisc6.hash | 2 +-
 package/ndisc6/ndisc6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ndisc6/ndisc6.hash b/package/ndisc6/ndisc6.hash
index 8d71bdeaf1..e37e33e654 100644
--- a/package/ndisc6/ndisc6.hash
+++ b/package/ndisc6/ndisc6.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	6acec8a0cb9efa3ac98456f46c3016aeec0598b0c7557c95242b5228ad62ca7a	ndisc6-1.0.2.tar.bz2
+sha256 0f41d6caf5f2edc1a12924956ae8b1d372e3b426bd7b11eed7d38bc974eec821  ndisc6-1.0.3.tar.bz2
diff --git a/package/ndisc6/ndisc6.mk b/package/ndisc6/ndisc6.mk
index 3ab8306d2e..1b15937ea1 100644
--- a/package/ndisc6/ndisc6.mk
+++ b/package/ndisc6/ndisc6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NDISC6_VERSION = 1.0.2
+NDISC6_VERSION = 1.0.3
 NDISC6_SOURCE = ndisc6-$(NDISC6_VERSION).tar.bz2
 NDISC6_SITE = http://www.remlab.net/files/ndisc6
 NDISC6_CONF_ENV = CC="$(TARGET_CC) -std=gnu99" LIBS=$(TARGET_NLS_LIBS)
-- 
2.11.0
