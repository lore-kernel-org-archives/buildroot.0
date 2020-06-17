From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:59:44 +0200
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.8
Message-ID: <20200617205807.E45F483BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3347143e42a88a87e51abd33539e21436aedff58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fetchmail/fetchmail.hash | 8 ++++----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index c9d9f4a466..b40ce7f7b1 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37024049
-sha256  16efec4b6019b4d2b6e43ed1d4f523dee019ac86754de856d0cf34d503d66011  fetchmail-6.4.6.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37037213/
+sha256  26cd936ece146e056cdf79a676a33738b4eab0a5ae2edf3fce5ba034721b09bd  fetchmail-6.4.8.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  7d2e440c94f98fcb44212314665bf8572182d24c  fetchmail-6.4.6.tar.xz
-md5  e6621616ccbde3792f6a3ccc85681fa9  fetchmail-6.4.6.tar.xz
+sha1  900386d69e2731999f142d5c16b4f2b69ed87f7a  fetchmail-6.4.8.tar.xz
+md5  4e5e67efe498038032576fa24c7f848e  fetchmail-6.4.8.tar.xz
 # Locally computed:
 sha256  89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index eaf6724fca..1835059f61 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).6
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).8
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
