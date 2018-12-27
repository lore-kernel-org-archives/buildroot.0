From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Dec 2018 13:20:54 +0200
Subject: [Buildroot] [PATCH] sed: bump to version 4.7
Message-ID: <f89610c802fd41fac43e03ee1decf03b2a6d1c89.1545909654.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/sed/sed.hash | 4 ++--
 package/sed/sed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index 470e5f259588..cc3bebafe190 100644
--- a/package/sed/sed.hash
+++ b/package/sed/sed.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/sed/sed-4.5.tar.xz.sig
+# https://ftp.gnu.org/gnu/sed/sed-4.7.tar.xz.sig
 # with the key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256	7aad73c8839c2bdadca9476f884d2953cdace9567ecd0d90f9959f229d146b40	sed-4.5.tar.xz
+sha256	2885768cd0a29ff8d58a6280a270ff161f6a3deb5690b2be6c49f46d4c67bd6a	sed-4.7.tar.xz
 # Locally calculated
 sha256	e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b	COPYING
diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 4b2ed0313f34..6fee598f66c1 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SED_VERSION = 4.5
+SED_VERSION = 4.7
 SED_SOURCE = sed-$(SED_VERSION).tar.xz
 SED_SITE = $(BR2_GNU_MIRROR)/sed
 SED_LICENSE = GPL-3.0
-- 
2.19.2
