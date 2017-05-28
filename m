From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 13:26:28 +0200
Subject: [Buildroot] [PATCH/next] package/emlog: bump version to 0.60
Message-ID: <20170528112628.17523-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/emlog/emlog.hash | 2 +-
 package/emlog/emlog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/emlog/emlog.hash b/package/emlog/emlog.hash
index e94691758..9d81d47ec 100644
--- a/package/emlog/emlog.hash
+++ b/package/emlog/emlog.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 0d82f06301b8486c54e5e36f304d5a83c2347c23b93c1344eacb0b5b3044485a  emlog-576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1.tar.gz
+sha256 9f791a00c86215306597b761ef5c5ad267efee5f01efbe23cfcc04e583aa402d  emlog-emlog-0.60.tar.gz
diff --git a/package/emlog/emlog.mk b/package/emlog/emlog.mk
index 70d133a4e..e0926e6cb 100644
--- a/package/emlog/emlog.mk
+++ b/package/emlog/emlog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EMLOG_VERSION = 576a6c0fcf76dfeff48124b2f5fc0b4207d88ca1
+EMLOG_VERSION = emlog-0.60
 EMLOG_SITE = $(call github,nicupavel,emlog,$(EMLOG_VERSION))
 EMLOG_LICENSE = GPL-2.0
 EMLOG_LICENSE_FILES = COPYING
-- 
2.11.0
