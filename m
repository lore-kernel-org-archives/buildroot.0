From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Apr 2018 13:52:52 +0300
Subject: [Buildroot] [PATCH] netcat-openbsd: bump to version 1.190
Message-ID: <0e61b9a00ffe4be545347f4baa1437af811210fc.1523962372.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/netcat-openbsd/netcat-openbsd.hash | 2 +-
 package/netcat-openbsd/netcat-openbsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index 1bf62bbcd6c8..2cf471344972 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 63d72b4e5ea629af148d6d655125dcbe48f4996a8a2a8c5e234c62eba2856b5f netcat-openbsd-debian_1.187-1.tar.gz
+sha256 06b04b163e8c923943b9fc276eea555625f615a530d5bd8fbdbc1af9b2b0d5db netcat-openbsd-debian_1.190-1.tar.gz
 sha256 e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c debian/copyright
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 6d3be500ebea..5784e4d68e2c 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = debian/1.187-1
+NETCAT_OPENBSD_VERSION = debian/1.190-1
 NETCAT_OPENBSD_SITE = git://anonscm.debian.org/collab-maint/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
 NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
-- 
2.17.0
