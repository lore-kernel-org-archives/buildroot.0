From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Sep 2016 07:45:30 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.3.2
Message-ID: <1475059530-25492-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 7c3afc0..cf89133 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.3.1.tar.bz2.sha256
-sha256	a242206dd119d5e6cc1b2253c116abbae03f9d930cb60b515fb0d248decf89a1	harfbuzz-1.3.1.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.3.2.tar.bz2.sha256
+sha256	8543a6372f08c5987c632dfaa86210c7edb3f43fbacd96095c609bc3539ce027	harfbuzz-1.3.2.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 7ddd81b..a014d7d 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.3.1
+HARFBUZZ_VERSION = 1.3.2
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.7.3
