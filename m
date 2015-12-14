From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 14 Dec 2015 14:17:00 +0000
Subject: [Buildroot] [PATCH 1/2] expedite: use a tar.bz2 tarball to save
	bandwitdh and disk space
Message-ID: <1450102621-33053-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/expedite/expedite.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/expedite/expedite.mk b/package/expedite/expedite.mk
index 9b232f8..27b4c44 100644
--- a/package/expedite/expedite.mk
+++ b/package/expedite/expedite.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 EXPEDITE_VERSION = 1.7.10
+EXPEDITE_SOURCE = expedite-$(EXPEDITE_VERSION).tar.bz2
 EXPEDITE_SITE = http://download.enlightenment.org/releases
 EXPEDITE_LICENSE = BSD-2c
 EXPEDITE_LICENSE_FILES = COPYING
-- 
2.4.10
