From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 1 Dec 2016 12:05:17 +0000
Subject: [Buildroot] [PATCH next] subversion: bump version to 1.9.5
Message-ID: <20161201120517.20703-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add a sha256 hash since upstream only provides one weak hash.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/subversion/subversion.hash | 5 ++++-
 package/subversion/subversion.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/subversion/subversion.hash b/package/subversion/subversion.hash
index 926bbc5..1a85961 100644
--- a/package/subversion/subversion.hash
+++ b/package/subversion/subversion.hash
@@ -1,2 +1,5 @@
 # From http://subversion.apache.org/download.cgi#recommended-release
-sha1	bc7d51fdda43bea01e1272dfe9d23d0a9d6cd11c	subversion-1.9.4.tar.bz2
+sha1 8bd6a44a1aed30c4c6b6b068488dafb44eaa6adf  subversion-1.9.5.tar.bz2
+# Locally calculated after checking PGP signature
+# https://www.apache.org/dist/subversion/subversion-1.9.5.tar.bz2.asc
+sha256 8a4fc68aff1d18dcb4dd9e460648d24d9e98657fbed496c582929c6b3ce555e5  subversion-1.9.5.tar.bz2
diff --git a/package/subversion/subversion.mk b/package/subversion/subversion.mk
index 720a1a1..05569c1 100644
--- a/package/subversion/subversion.mk
+++ b/package/subversion/subversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUBVERSION_VERSION = 1.9.4
+SUBVERSION_VERSION = 1.9.5
 SUBVERSION_SOURCE = subversion-$(SUBVERSION_VERSION).tar.bz2
 SUBVERSION_SITE = http://mirror.catn.com/pub/apache/subversion
 SUBVERSION_LICENSE = Apache-2.0
-- 
2.10.1
