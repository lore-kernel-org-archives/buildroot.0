From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jan 2017 08:21:41 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.4.2
Message-ID: <20170124112141.11429-1-gustavo@zacarias.com.ar>
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
index 48cb17d..6bf5bee 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.1.tar.bz2.sha256
-sha256	85a27fab639a1d651737dcb6b69e4101e3fd09522fdfdcb793df810b5cb315bd	harfbuzz-1.4.1.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.2.tar.bz2.sha256
+sha256	8f234dcfab000fdec24d43674fffa2fdbdbd654eb176afbde30e8826339cb7b3	harfbuzz-1.4.2.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 18a524a..458b072 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.4.1
+HARFBUZZ_VERSION = 1.4.2
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.10.2
