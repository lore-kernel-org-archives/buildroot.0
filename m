From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu,  8 Apr 2021 08:02:46 +0300
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.1.1
Message-ID: <20210408050246.570397-1-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.1.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index f84bd04cc0..98f966ee3d 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6de2af2ecfd7bff9b3634b6c5c29b209b25e147858d460469e8eb88e6d198692  timescaledb-2.1.0.tar.gz
+sha256  e928c939803706d0d5b11d6751d4f0d0514e540ceffc74a46a9732f9a111d313  timescaledb-2.1.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 783017636b..d2a48a0f63 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.1.0
+TIMESCALEDB_VERSION = 2.1.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.30.2
