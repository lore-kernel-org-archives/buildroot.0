From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 15 Sep 2019 15:02:03 +0200
Subject: [Buildroot] [PATCH 1/2] package/fping: bump to version 4.2
Message-ID: <1568552524-2059-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See full Changelog: http://fping.org/dist/CHANGELOG.md

Also add hash for license file

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/fping/fping.hash | 5 ++++-
 package/fping/fping.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index e97709c..0aa0330 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,2 +1,5 @@
 # Locally calculated
-sha256 67eb4152b98ad34f99d2eec4e1098a0bb52caf13c0c89cd147349d08190fe8ce  fping-4.0.tar.gz
+sha256 7d339674b6a95aae1d8ad487ff5056fd95b474c3650938268f6a905c3771b64a  fping-4.2.tar.gz
+
+# Hash for license file
+sha256 6051b27e4b4a648f7bc8b329024da53a6e95ce88fcf0ccc259c371a74b741757  COPYING
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 5af46c6..5d3ad59 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 4.0
+FPING_VERSION = 4.2
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
2.7.4
