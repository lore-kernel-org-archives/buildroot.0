From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Dec 2020 20:47:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.14
Message-ID: <20201203194710.3229489-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog:
https://sourceforge.net/p/fetchmail/git/ci/legacy_64/tree/NEWS

Removed md5 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/fetchmail.hash | 7 +++----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index b40ce7f7b1..759138ec2d 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,7 +1,6 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37037213/
-sha256  26cd936ece146e056cdf79a676a33738b4eab0a5ae2edf3fce5ba034721b09bd  fetchmail-6.4.8.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37162383/
+sha256  424707390f7cdc6d16db4887931117f2242873846b28cc1d0ae1c0ecf158bdcb  fetchmail-6.4.14.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  900386d69e2731999f142d5c16b4f2b69ed87f7a  fetchmail-6.4.8.tar.xz
-md5  4e5e67efe498038032576fa24c7f848e  fetchmail-6.4.8.tar.xz
+sha1  f058c877d7909fe196b5d0425b052c99f87f86e3  fetchmail-6.4.14.tar.xz
 # Locally computed:
 sha256  89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 1835059f61..430ec55329 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).8
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).14
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.27.0
