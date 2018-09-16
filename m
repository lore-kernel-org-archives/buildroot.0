From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 Sep 2018 20:46:03 +0200
Subject: [Buildroot] [PATCH 5/8] restorecond: bump to version 2.8
In-Reply-To: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
References: <20180916184606.27835-1-fontaine.fabrice@gmail.com>
Message-ID: <20180916184606.27835-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/restorecond/restorecond.hash | 5 ++++-
 package/restorecond/restorecond.mk   | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/restorecond/restorecond.hash b/package/restorecond/restorecond.hash
index f52bbd2161..d171c50524 100644
--- a/package/restorecond/restorecond.hash
+++ b/package/restorecond/restorecond.hash
@@ -1,2 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 cb8e0a8d706cb2c1f105125f3514dffffefcbcfb49199183a7f91ab0bdf1f24d restorecond-2.7.tar.gz
+sha256 323cab1128e5308cd85fea0e5c98e3c8973e1ada0b659f2fce76187e192271bf restorecond-2.8.tar.gz
+
+# Hash for license file
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/restorecond/restorecond.mk b/package/restorecond/restorecond.mk
index aaa59b3351..7e43d9c8df 100644
--- a/package/restorecond/restorecond.mk
+++ b/package/restorecond/restorecond.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RESTORECOND_VERSION = 2.7
-RESTORECOND_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+RESTORECOND_VERSION = 2.8
+RESTORECOND_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 RESTORECOND_LICENSE = GPL-2.0
 RESTORECOND_LICENSE_FILES = COPYING
 
-- 
2.17.1
