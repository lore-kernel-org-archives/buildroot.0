From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Thu, 15 Sep 2016 16:04:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/autoconf-archive: bump to version
	2016.03.20
Message-ID: <20160915140441.4682-1-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/autoconf-archive/autoconf-archive.hash | 2 +-
 package/autoconf-archive/autoconf-archive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autoconf-archive/autoconf-archive.hash b/package/autoconf-archive/autoconf-archive.hash
index 5576566..6982a4d 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 7c0467a5dbd2340153bca5a477bd92fbc951d9ee3cbed92f16f6bf08ac0c350a  autoconf-archive-2015.09.25.tar.xz
+sha256 88fb2efff640eddd28a52ae550ff5561bca3bd2bba09e1d7b0580e719875e437  autoconf-archive-2016.03.20.tar.xz
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 98acba3..86956eb 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2015.09.25
+AUTOCONF_ARCHIVE_VERSION = 2016.03.20
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
-- 
2.9.3
