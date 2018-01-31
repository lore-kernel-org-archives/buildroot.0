From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 12:15:37 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] squid: bump version to
 3.5.27
Message-ID: <20180131123645.2D70E88170@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ee653689dbe0bf08664ae93b6b41eb0bda56f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

And add a hash for the license files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 001b834aacef82a6205f5b319037d42d0fdb13cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 +++++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 91ba9e6fc4..8787cb25ef 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,5 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.26.tar.xz.asc
-md5 510e2c84773879c00d0e7ced997864d9  squid-3.5.26.tar.xz
-sha1 51a664217957b35de8b7fae180b9f93a759a4204  squid-3.5.26.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.27.tar.xz.asc
+md5 39ef8199675d48a314b540f92c00c545 squid-3.5.27.tar.xz
+sha1 1e69c96d13cd49844da3bcf33a0b428fbe7b6f77 squid-3.5.27.tar.xz
+# Locally calculated
+sha256 58f5d05257af1fb964fde20e134d660fac9afa86b6fd8c70d63ead63068378fa COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7379750894..cd91600e49 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).26
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).27
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
