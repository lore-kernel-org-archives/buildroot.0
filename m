From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 13 Apr 2019 15:33:40 +0200
Subject: [Buildroot] [PATCH 1/3] luadbi: bump to version 0.7.2
Message-ID: <20190413133342.25091-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luadbi/luadbi.hash | 2 +-
 package/luadbi/luadbi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index d72690d9a..07a9cc218 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256 723f63b744b7367ddfd6bbf7a7e6f6867aa1eaabbbc2bab5dc8a90e80b0c34c2  luadbi-0.6-2.src.rock
+sha256 9ebbbaf4ea1f48628341e9ff3c1de10a57200c02453734f41b8016b0fc7b4956  luadbi-0.7.2-1.src.rock
 sha256 988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi/luadbi.mk b/package/luadbi/luadbi.mk
index 969c01ee2..fbae6b319 100644
--- a/package/luadbi/luadbi.mk
+++ b/package/luadbi/luadbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_VERSION = 0.6-2
+LUADBI_VERSION = 0.7.2-1
 LUADBI_SUBDIR = luadbi
 LUADBI_LICENSE = MIT
 LUADBI_LICENSE_FILES = $(LUADBI_SUBDIR)/COPYING
-- 
2.17.1
