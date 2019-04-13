From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 13 Apr 2019 15:33:41 +0200
Subject: [Buildroot] [PATCH 2/3] luadbi-sqlite3: bump to version 0.7.2
In-Reply-To: <20190413133342.25091-1-francois.perrad@gadz.org>
References: <20190413133342.25091-1-francois.perrad@gadz.org>
Message-ID: <20190413133342.25091-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luadbi-sqlite3/luadbi-sqlite3.hash | 2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index 093a9067f..3e865df30 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 2868dad4d189368fcf5cddd191965c8cb2efaa3a3ba83d50e6a88c30353f74ce  luadbi-sqlite3-0.6-2.src.rock
+sha256 c5b043db43941a3c6e43d3e3699236846ed6d03a6c4cb12fa1a497f965138d9f  luadbi-sqlite3-0.7.2-1.src.rock
 sha256 988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
index 44cf4d107..4ae2b5cf3 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.mk
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_SQLITE3_VERSION = 0.6-2
+LUADBI_SQLITE3_VERSION = 0.7.2-1
 LUADBI_SQLITE3_SUBDIR = luadbi
 LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
-- 
2.17.1
