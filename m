From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Mar 2021 10:14:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.18
Message-ID: <20210328081401.200616-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37249830/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index b526163849..698d83c88b 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37215482/
-sha256  044b9a0ac03afbae7744979defe3e2e32e39141bca68fd0c8deda2ed40884fb9  fetchmail-6.4.16.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37249830/
+sha256  302dc9bcdc6927dedf375d2baaead2347557faa70d98b1da83f2409fa6fb259f  fetchmail-6.4.18.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  ec910eed3db4d8c44469aabaf33f529334a2fdb5  fetchmail-6.4.16.tar.xz
+sha1  1fd3e4f30bd9ba7bdcaed5edfca080dc6f66377e  fetchmail-6.4.18.tar.xz
 # Locally computed:
 sha256  8e3ec4863456a26fcd1cf84fadd4146efcb2fd8515bcec482e0f2b7060108895  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 2db635ec66..6fe9b5b3d7 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).16
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).18
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.29.2
