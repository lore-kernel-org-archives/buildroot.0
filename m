From: Martin Bark <martin@barkynet.com>
Date: Sun, 14 Jun 2015 15:08:15 +0100
Subject: [Buildroot] [PATCH 1/2] package/tzdata: bump version to 2015e
Message-ID: <1434290896-17390-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index d02829a..091f57c 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256  860fac5f5f57f7a2dfc1ba682dbd1f5c0f0b597f761571277b6ed6561e22365a  tzdata2015c.tar.gz
+# From 2015e release anouncement.  See http://mm.icann.org/pipermail/tz-announce/2015-June/000032.html
+sha512  86498190a20c5c67827aa75f7e9c6aa6c19d58a88a70425ce70d5ae7cea42dc7386eb2867fa455fcfcdedc6a105ad70fbbdc7c27c7a58a51bd21d76a135983ce  tzdata2015e.tar.gz
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index d8512a3..eb6da6c 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2015c
+TZDATA_VERSION = 2015e
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = ftp://ftp.iana.org/tz/releases
 TZDATA_DEPENDENCIES = host-tzdata
-- 
2.1.4
