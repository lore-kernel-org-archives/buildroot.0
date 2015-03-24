From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Mar 2015 09:31:29 -0300
Subject: [Buildroot] [PATCH] which: bump to version 2.21
Message-ID: <1427200289-28332-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash file and switch to gnu mirror.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/which/which.hash | 2 ++
 package/which/which.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 package/which/which.hash

diff --git a/package/which/which.hash b/package/which/which.hash
new file mode 100644
index 0000000..fe649ab
--- /dev/null
+++ b/package/which/which.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	f4a245b94124b377d8b49646bf421f9155d36aa7614b6ebf83705d3ffc76eaad	which-2.21.tar.gz
diff --git a/package/which/which.mk b/package/which/which.mk
index 019c479..938b770 100644
--- a/package/which/which.mk
+++ b/package/which/which.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WHICH_VERSION = 2.20
-WHICH_SITE = http://carlo17.home.xs4all.nl/which
+WHICH_VERSION = 2.21
+WHICH_SITE = $(BR2_GNU_MIRROR)/which
 WHICH_LICENSE = GPLv3+
 WHICH_LICENSE_FILES = COPYING
 
-- 
2.0.5
