From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Jul 2020 20:43:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/qlibc: bump to version 2.4.5
Message-ID: <20200724184319.987594-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qlibc/qlibc.hash | 4 ++--
 package/qlibc/qlibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qlibc/qlibc.hash b/package/qlibc/qlibc.hash
index 616194f8d9..6abb16b274 100644
--- a/package/qlibc/qlibc.hash
+++ b/package/qlibc/qlibc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 93512e2203aaadda7aa62039b29500d9236b878e16f070328c58dc9d23da94d7  qlibc-2.4.4.tar.gz
-sha256 7c9d03656af4c0acf0a35e29459086498dd64080eac6d2945bc1c064aaf18132  LICENSE
+sha256  e195c97453c260acea4421146ba992d9a4d89732eac345b3765c43cc3326d2ad  qlibc-2.4.5.tar.gz
+sha256  7c9d03656af4c0acf0a35e29459086498dd64080eac6d2945bc1c064aaf18132  LICENSE
diff --git a/package/qlibc/qlibc.mk b/package/qlibc/qlibc.mk
index 1b234f7e47..6cce8201bd 100644
--- a/package/qlibc/qlibc.mk
+++ b/package/qlibc/qlibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QLIBC_VERSION = 2.4.4
+QLIBC_VERSION = 2.4.5
 QLIBC_SITE = $(call github,wolkykim,qlibc,v$(QLIBC_VERSION))
 QLIBC_LICENSE = BSD-2-Clause
 QLIBC_LICENSE_FILES = LICENSE
-- 
2.27.0
