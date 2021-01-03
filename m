From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  3 Jan 2021 18:23:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.15
Message-ID: <20210103172342.2034002-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated license hash due to copyright year bump:
https://sourceforge.net/p/fetchmail/git/ci/87069e887226907ebb0e557ae09e387396ad9a6b/tree/COPYING

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37189309/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/fetchmail.hash | 8 ++++----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 759138ec2d..5b9049814d 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37162383/
-sha256  424707390f7cdc6d16db4887931117f2242873846b28cc1d0ae1c0ecf158bdcb  fetchmail-6.4.14.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37189309/
+sha256  735b217474937e13cfcdea2d42a346bf68487e0d61efebe4d0d9eddcb3a26b96  fetchmail-6.4.15.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  f058c877d7909fe196b5d0425b052c99f87f86e3  fetchmail-6.4.14.tar.xz
+sha1  6491de7e4d2ef1aef6808127e8ca9d803bbdc220  fetchmail-6.4.15.tar.xz
 # Locally computed:
-sha256  89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
+sha256  8e3ec4863456a26fcd1cf84fadd4146efcb2fd8515bcec482e0f2b7060108895  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 430ec55329..d1ba95891b 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).14
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).15
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.29.2
