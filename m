From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 May 2016 15:46:14 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.5.19
Message-ID: <20160510135145.C8ACC81880@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a99fce5ab47a7d714397bad3fde12717f7435bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes regression introduced in 3.5.18 (via CVE-2016-4554 patch/fix).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index 8ddc71e..c8f25b0 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.18.tar.xz.asc
-md5	9ae3843c341e8a142e963ab937c51cdd	squid-3.5.18.tar.xz
-sha1	cd0596fdc3d6f11bb0ed50d8deb11ea950f0242d	squid-3.5.18.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.19.tar.xz.asc
+md5	a1d990284c429a63ee85d80ee5b3b8b9	squid-3.5.19.tar.xz
+sha1	809133b751df9fb5bca07f181b3e2f7df392f761	squid-3.5.19.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 4bdc7b7..847ed30 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).18
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).19
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
