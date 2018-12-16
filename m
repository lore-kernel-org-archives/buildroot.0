From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:51 +0100
Subject: [Buildroot] [PATCH 07/12] lua-datafile: bump to version 0.6
In-Reply-To: <20181216085656.30105-1-francois.perrad@gadz.org>
References: <20181216085656.30105-1-francois.perrad@gadz.org>
Message-ID: <20181216085656.30105-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-datafile/lua-datafile.hash | 2 +-
 package/lua-datafile/lua-datafile.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index 83c346eae..8b223f0d5 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 37a33079c3476477f19de14bebd664635a39a57dd05a2709c3a402cbc1e79a6b  datafile-0.4-1.src.rock
+sha256 4f7d58c50267b5ebd2145e52aaa5fb63fbf63a74ae765f08e2d0dddd570b6b6a  datafile-0.6-1.src.rock
diff --git a/package/lua-datafile/lua-datafile.mk b/package/lua-datafile/lua-datafile.mk
index 75aef5290..5d30fdcf9 100644
--- a/package/lua-datafile/lua-datafile.mk
+++ b/package/lua-datafile/lua-datafile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_DATAFILE_VERSION = 0.4-1
+LUA_DATAFILE_VERSION = 0.6-1
 LUA_DATAFILE_NAME_UPSTREAM = datafile
 LUA_DATAFILE_SUBDIR = datafile
 LUA_DATAFILE_LICENSE = MIT
-- 
2.17.1
