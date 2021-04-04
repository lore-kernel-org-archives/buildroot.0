From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:39:15 +0200
Subject: [Buildroot] [git commit branch/2020.11.x] package/lldpd: bump to
 version 1.0.7
Message-ID: <20210404092638.6CE618B679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9662156259b43aa0ca07221ad4e622376bae4a6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

https://github.com/lldpd/lldpd/blob/1.0.7/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c9670dfa21d667c69ea794d5e15055cff134d6c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
