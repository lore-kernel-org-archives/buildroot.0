From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 21 Dec 2020 19:01:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/lldpd: bump to version 1.0.7
Message-ID: <20201221180148.806353-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/lldpd/lldpd/blob/1.0.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lldpd/lldpd.hash | 4 ++--
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 4283b4aec8..ee6e72ba55 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking gpg key
-# https://media.luffy.cx/files/lldpd/lldpd-1.0.5.tar.gz.gpg
+# https://media.luffy.cx/files/lldpd/lldpd-1.0.7.tar.gz.gpg
 # using key AEF2348766F371C689A7360095A42FE8353525F9
-sha256  2dd3b212f4dbabfcbb2794c0010b245f9f8e74b387984e757be6243a74c6cb99  lldpd-1.0.5.tar.gz
+sha256  1df79179d489c841b49265f2ab5ff05f284a647e95862d2f3c02b3fb079a87e1  lldpd-1.0.7.tar.gz
 sha256  0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 585d1ed7ba..7860b70c39 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLDPD_VERSION = 1.0.5
+LLDPD_VERSION = 1.0.7
 LLDPD_SITE = https://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_CHECK),check) \
-- 
2.29.2
