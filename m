From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Oct 2017 09:36:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.6.9
Message-ID: <20171028073607.4638-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.samba.org/samba/history/samba-4.6.9.html

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 3 ++-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 19b175a58e..7446b1bdb8 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 581deeb2543f5cedcb556cb950d0e82690d9f0cd33811d76624502ca0c32575d  samba-4.6.8.tar.gz
+sha256 c31db4aad82f0b9588ef6c4b4dab5dce3fa1787bd298e62d953c2628bb1af21a  samba-4.6.9.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index f8001bbe7f..7502fa6a13 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.8
+SAMBA4_VERSION = 4.6.9
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
