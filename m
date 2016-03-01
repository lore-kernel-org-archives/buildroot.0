From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 14:33:37 +0100
Subject: [Buildroot] [git commit] harfbuzz: bump to version 1.2.3
Message-ID: <20160302202800.93E5380203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=310f73e4150149a4ce345a07c7cbcc076f899fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index b7330fc..a6d5187 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.2.0.tar.bz2.sha256
-sha256	79ff5305153d15931fbdda80c9612783b0283dee44f4c2af71aa37353daaa685	harfbuzz-1.2.0.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.2.3.tar.bz2.sha256
+sha256	8216d2404aaab7fde87be0365a90d64aa6c55928e104557cfcb37b54a096cb8c	harfbuzz-1.2.3.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 7cdc356..781c48e 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.2.0
+HARFBUZZ_VERSION = 1.2.3
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
