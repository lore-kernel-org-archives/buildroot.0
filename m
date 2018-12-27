From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 16:35:55 +0100
Subject: [Buildroot] [git commit] package/sed: bump to version 4.7
Message-ID: <20181227153126.9C25380E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f3183f316648a2f853714f38ff3393c0996fb10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sed/sed.hash | 4 ++--
 package/sed/sed.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sed/sed.hash b/package/sed/sed.hash
index 470e5f2595..cc3bebafe1 100644
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
index 4b2ed0313f..6fee598f66 100644
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
