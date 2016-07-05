From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 17:21:06 +0200
Subject: [Buildroot] [git commit] squid: bump version to 3.5.20
Message-ID: <20160705152114.0313B8222B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e685431956600444d6cfc8c1c37c5f0f076fb10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squid/squid.hash | 6 +++---
 package/squid/squid.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index c8f25b0..b25a0e0 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,3 +1,3 @@
-# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.19.tar.xz.asc
-md5	a1d990284c429a63ee85d80ee5b3b8b9	squid-3.5.19.tar.xz
-sha1	809133b751df9fb5bca07f181b3e2f7df392f761	squid-3.5.19.tar.xz
+# From http://www.squid-cache.org/Versions/v3/3.5/squid-3.5.20.tar.xz.asc
+md5 48fb18679a30606de98882528beab3a7  squid-3.5.20.tar.xz
+sha1 2bb6d3568e7167c9b99fea092a97287d0e430863  squid-3.5.20.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 847ed30..7179b33 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.5
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).19
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).20
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
