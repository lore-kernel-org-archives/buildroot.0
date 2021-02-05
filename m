From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Feb 2021 13:47:18 +0100
Subject: [Buildroot] [git commit] package/timescaledb: bump version to 2.0.1
Message-ID: <20210205122651.EB81283C5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5aab68465e4b3174a2f7975d5f3ccfa587db62a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/timescale/timescaledb/releases/tag/2.0.1

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index afadf637e2..f275c3d4b0 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f74ebebb4461e4e77273615551ccf9250fac0bdef7bdacf5c92ee3a6884d7782  timescaledb-2.0.0.tar.gz
+sha256  96e51d5240547f0223c34b91263f6fffca46927710764bf450aa61e9756189bd  timescaledb-2.0.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 94c925932f..0d5dc12d9d 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.0.0
+TIMESCALEDB_VERSION = 2.0.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
