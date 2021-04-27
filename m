From: Dick Olsson <hi@senzilla.io>
Date: Tue, 27 Apr 2021 22:42:22 +0000
Subject: [Buildroot] [PATCH 03/10] package/s6: bump to version 2.10.0.3
Message-ID: <DrSJX2qgmf0fh4cVi0VPE2aoCmCewBVXQaHVSjQE7wI@cp4-web-028.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change hash file indentation to 2 spaces.

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6/s6.hash | 4 ++--
 package/s6/s6.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 9cc6f4477d..a829700d97 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 b23afce87080b848b89499e85ebd93c20269e6db23f6ef65e58386c9cecd6c21  s6-2.10.0.2.tar.gz
-sha256 adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  1d21373151704150df0e8ed199f097f6ee5d2befb9a68aca4f20f3862e5d8757  s6-2.10.0.3.tar.gz
+sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 443ecbbffd..1a5757fe81 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.10.0.2
+S6_VERSION = 2.10.0.3
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
-- 
2.30.2
