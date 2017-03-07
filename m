From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Mar 2017 16:09:46 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] harfbuzz: security bump
	to version 1.4.4
Message-ID: <20170307155609.45C3481EA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a71ee5ce2af37b1b303f56d91ac32b5b8bae6ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes a buffer-overrun in Bengali.
Switch to https URL to avoid a small delay in protocol redirection.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 7bbdd9afa4fa1014fdb050c1437d6cd90ca3a44a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 6bf5bee..b7da64b 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,2 +1,2 @@
-# From http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.2.tar.bz2.sha256
-sha256	8f234dcfab000fdec24d43674fffa2fdbdbd654eb176afbde30e8826339cb7b3	harfbuzz-1.4.2.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.4.4.tar.bz2.sha256
+sha256	35d2f8ca476cbbec64ee824eca6b0209ff8db0334990b9f5af893b94f119d255	harfbuzz-1.4.4.tar.bz2
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 458b072..6464480 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.4.2
-HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release
+HARFBUZZ_VERSION = 1.4.4
+HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
 HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
