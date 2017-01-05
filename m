From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jan 2017 12:10:17 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 1.4.0
Message-ID: <20170105151017.1980-1-gustavo@zacarias.com.ar>
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
index b38b049..1e9a5ac 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.3.4.tar.bz2.sha256
-sha256	718aa6fcadef1a6548315b8cfe42cc27e926256302c337f42df3a443843f6a2b	harfbuzz-1.3.4.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.0.tar.bz2.sha256
+sha256	8497eca976f3c4cdee7f46ffc228d755d2f0651da7c253fa6ae99d5a61ddd1b5	harfbuzz-1.4.0.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index eafe939..a0112de 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.3.4
+HARFBUZZ_VERSION = 1.4.0
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.10.2
