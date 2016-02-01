From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon,  1 Feb 2016 15:34:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/autoconf-archive: bump to version
	2015.09.25
Message-ID: <1454337295-14367-1-git-send-email-thomas.claveirole@green-communications.fr>
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
index c310f5a..5576566 100644
--- a/package/autoconf-archive/autoconf-archive.hash
+++ b/package/autoconf-archive/autoconf-archive.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256 69715bdd078f552ca85e498a94543e11cb8bcdf0359e659b84d84d19372b0dc5  autoconf-archive-2015.02.24.tar.xz
+sha256 7c0467a5dbd2340153bca5a477bd92fbc951d9ee3cbed92f16f6bf08ac0c350a  autoconf-archive-2015.09.25.tar.xz
diff --git a/package/autoconf-archive/autoconf-archive.mk b/package/autoconf-archive/autoconf-archive.mk
index 673a57f..98acba3 100644
--- a/package/autoconf-archive/autoconf-archive.mk
+++ b/package/autoconf-archive/autoconf-archive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_ARCHIVE_VERSION = 2015.02.24
+AUTOCONF_ARCHIVE_VERSION = 2015.09.25
 AUTOCONF_ARCHIVE_SOURCE = autoconf-archive-$(AUTOCONF_ARCHIVE_VERSION).tar.xz
 AUTOCONF_ARCHIVE_SITE = $(BR2_GNU_MIRROR)/autoconf-archive
 AUTOCONF_ARCHIVE_LICENSE = GPLv3+ with exception
-- 
2.7.0
