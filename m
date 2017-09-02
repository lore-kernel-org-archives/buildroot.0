From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Sep 2017 18:56:35 +0200
Subject: [Buildroot] [PATCH 05/12] luajson: bump to version 1.3.4
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902165642.22943-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luajson/luajson.hash | 2 +-
 package/luajson/luajson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
index deda5efd6..36534fe34 100644
--- a/package/luajson/luajson.hash
+++ b/package/luajson/luajson.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4898e5575713b37a1eb9badbd3968e15ec1856115daaed9819acf39113616619  luajson-1.3.3-1.src.rock
+sha256 28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
diff --git a/package/luajson/luajson.mk b/package/luajson/luajson.mk
index 67bc26644..81a9f8113 100644
--- a/package/luajson/luajson.mk
+++ b/package/luajson/luajson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJSON_VERSION = 1.3.3-1
+LUAJSON_VERSION = 1.3.4-1
 LUAJSON_SUBDIR = luajson
 LUAJSON_LICENSE = MIT
 LUAJSON_LICENSE_FILES = $(LUAJSON_SUBDIR)/LICENSE
-- 
2.11.0
