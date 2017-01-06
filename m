From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Jan 2017 17:07:31 +0100
Subject: [Buildroot] [git commit] harfbuzz: bump to version 1.4.1
Message-ID: <20170106160826.DCCB681EB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47b0354775214b8e5aa3b0a63fafe76685dc3bf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 1e9a5ac..48cb17d 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.0.tar.bz2.sha256
-sha256	8497eca976f3c4cdee7f46ffc228d755d2f0651da7c253fa6ae99d5a61ddd1b5	harfbuzz-1.4.0.tar.bz2
+# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.1.tar.bz2.sha256
+sha256	85a27fab639a1d651737dcb6b69e4101e3fd09522fdfdcb793df810b5cb315bd	harfbuzz-1.4.1.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index a0112de..18a524a 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.4.0
+HARFBUZZ_VERSION = 1.4.1
 HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
