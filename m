From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Nov 2017 21:11:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.6.10
Message-ID: <20171115201101.16575-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Quoting release notes
https://www.samba.org/samba/history/samba-4.6.10.html

"This is an additional bugfix release to address a possible data
 corruption issue. Please update immediately! For details, please see

  https://bugzilla.samba.org/show_bug.cgi?id=13130

 Samba 4.6.0 and newer is affected by this issue."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 2 +-
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 7446b1bdb8..6821144d1d 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c31db4aad82f0b9588ef6c4b4dab5dce3fa1787bd298e62d953c2628bb1af21a  samba-4.6.9.tar.gz
+sha256 5913a569b54c6bc261bc245d7326fabfcba42839d15a82db48c047de1eb19626  samba-4.6.10.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 7502fa6a13..40436ca731 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.6.9
+SAMBA4_VERSION = 4.6.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.11.0
