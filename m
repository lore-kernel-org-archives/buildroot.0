From: Christian Stewart <christian@paral.in>
Date: Wed, 10 Feb 2021 15:39:02 -0800
Subject: [Buildroot] [PATCH v1 1/1] package/runc: bump to version 1.0.0-rc93
Message-ID: <20210210233902.2582441-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index d792947d5f..afe396368d 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	28378df983a3c586ed3ec8c76a774a9b10f36a0c323590a284b801cce95cc61f  runc-1.0.0-rc92.tar.gz
+sha256  e42456078d2f76c925cdd656e4f423b918525d8188521de05e893b6bb473a6f8  runc-1.0.0-rc93.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index c0de2783e4..ba2ab3081a 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -10,7 +10,7 @@ RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
 RUNC_CPE_ID_VERSION = 1.0.0
-RUNC_CPE_ID_UPDATE = rc92
+RUNC_CPE_ID_UPDATE = rc93
 
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
-- 
2.30.0
