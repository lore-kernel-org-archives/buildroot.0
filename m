From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Tue, 22 Jun 2021 15:41:21 +0300
Subject: [Buildroot] [PATCH 2/2] package/timescaledb: Bump version to 2.3.0
In-Reply-To: <20210622124121.999281-1-fido_max@inbox.ru>
References: <20210622124121.999281-1-fido_max@inbox.ru>
Message-ID: <20210622124121.999281-3-fido_max@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 98f966ee3d..e97045f7d5 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e928c939803706d0d5b11d6751d4f0d0514e540ceffc74a46a9732f9a111d313  timescaledb-2.1.1.tar.gz
+sha256  730e61e48f471c1d643494421d21e43766128cbcb62a5c4b138c171379195cf2  timescaledb-2.3.0.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index d2a48a0f63..27e9142b0c 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.1.1
+TIMESCALEDB_VERSION = 2.3.0
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.31.1
