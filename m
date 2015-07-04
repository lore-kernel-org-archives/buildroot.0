From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jul 2015 09:33:04 -0300
Subject: [Buildroot] [PATCH] harfbuzz: bump to version 0.9.41
Message-ID: <1436013184-29541-1-git-send-email-gustavo@zacarias.com.ar>
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
index 131e8d3..26f4688 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.40.tar.bz2.sha256
-sha256	1771d53583be6d91ca961854b2a24fb239ef0545eed221ae3349abae0ab8321f	harfbuzz-0.9.40.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.41.tar.bz2.sha256
+sha256	d81aa53d0c02b437beeaac159d7fc16394d676bbce0860fb6f6a10b587dc057c	harfbuzz-0.9.41.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 9cfd613..0adfb53 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 0.9.40
+HARFBUZZ_VERSION = 0.9.41
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.3.6
