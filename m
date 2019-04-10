From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:08:52 +0200
Subject: [Buildroot] [git commit] package/json-for-modern-cpp: bump version
 to 3.6.1
Message-ID: <20190410170451.1EB1681D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8225fdfa6c5c54e5a6d409271f390777516f1de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash after upstream bumped copyright year:
https://github.com/nlohmann/json/commit/b37392b7ace1a830d95b7140bc6b449bd7c70a34#diff-8d416c704c45322db422b7169afb686a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-for-modern-cpp/json-for-modern-cpp.hash | 4 ++--
 package/json-for-modern-cpp/json-for-modern-cpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.hash b/package/json-for-modern-cpp/json-for-modern-cpp.hash
index cff01db74c..47e6a5e59a 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.hash
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256	e0b1fc6cc6ca05706cce99118a87aca5248bd9db3113e703023d23f044995c1d	json-v3.5.0.tar.gz
-sha256	7b875bb7a4e28abb7956ea821b4b7d88ff6a2a4fabf261c3993730a365ec56dd	LICENSE.MIT
+sha256	80c45b090e40bf3d7a7f2a6e9f36206d3ff710acfa8d8cc1f8c763bb3075e22e	json-v3.6.1.tar.gz
+sha256	7400586ce89c6a2cc65f6ca46997da5d356a230673d3a211e040b783f23578a1	LICENSE.MIT
diff --git a/package/json-for-modern-cpp/json-for-modern-cpp.mk b/package/json-for-modern-cpp/json-for-modern-cpp.mk
index 86399fd60d..09dbf30839 100644
--- a/package/json-for-modern-cpp/json-for-modern-cpp.mk
+++ b/package/json-for-modern-cpp/json-for-modern-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSON_FOR_MODERN_CPP_VERSION = v3.5.0
+JSON_FOR_MODERN_CPP_VERSION = v3.6.1
 JSON_FOR_MODERN_CPP_SOURCE = json-$(JSON_FOR_MODERN_CPP_VERSION).tar.gz
 JSON_FOR_MODERN_CPP_SITE = $(call github,nlohmann,json,$(JSON_FOR_MODERN_CPP_VERSION))
 JSON_FOR_MODERN_CPP_LICENSE = MIT
