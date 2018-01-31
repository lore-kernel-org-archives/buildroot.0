From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:14:49 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] squid: bump version to
 3.5.25
Message-ID: <20180131123645.0A53588170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ceb374ae17614e17b0785e88b3e5d6bc2cdf6176
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 330ad683c6b0c486473bb497d7639a71d5da67c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index d9b7924de1..95762bc8bd 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.24.tar.xz.asc
-md5 3fae511e16b6379b61c011914673973d  squid-3.5.24.tar.xz
-sha1 f203637783301a4b86e554b6dd226de721762ae5  squid-3.5.24.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.25.tar.xz.asc
+md5 6b7dd7b42b1adacf08f3155640ea2782  squid-3.5.25.tar.xz
+sha1 63ea00cb918e3106fd91b286ec907f1681e0f0e8  squid-3.5.25.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 9abf3cd8e6..09d9bca139 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).24
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).25
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
