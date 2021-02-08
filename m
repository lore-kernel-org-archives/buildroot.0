From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 8 Feb 2021 22:15:26 +0100
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.16
Message-ID: <20210208205603.9ADA98183D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03b0e40a31052ccb97484bf086d2c39ad7658909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://sourceforge.net/p/fetchmail/mailman/message/37215482/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fetchmail/fetchmail.hash | 6 +++---
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 5b9049814d..b526163849 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/37189309/
-sha256  735b217474937e13cfcdea2d42a346bf68487e0d61efebe4d0d9eddcb3a26b96  fetchmail-6.4.15.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37215482/
+sha256  044b9a0ac03afbae7744979defe3e2e32e39141bca68fd0c8deda2ed40884fb9  fetchmail-6.4.16.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  6491de7e4d2ef1aef6808127e8ca9d803bbdc220  fetchmail-6.4.15.tar.xz
+sha1  ec910eed3db4d8c44469aabaf33f529334a2fdb5  fetchmail-6.4.16.tar.xz
 # Locally computed:
 sha256  8e3ec4863456a26fcd1cf84fadd4146efcb2fd8515bcec482e0f2b7060108895  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index d1ba95891b..788560510f 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).15
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).16
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
