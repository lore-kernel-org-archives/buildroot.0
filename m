From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Tue, 28 Apr 2020 20:57:32 -0500
Subject: [Buildroot] [PATCH] package/fetchmail: bump to version 6.4.4
Message-ID: <20200429015732.29506-1-ryanbarnett3@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
---
 package/fetchmail/fetchmail.hash | 10 +++++-----
 package/fetchmail/fetchmail.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index e55aa5733c..c5670a0f7a 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/36971969/
-sha256 b0360e14b9aa5d065eef8ff99ad0347ef6cbbfc934c8114908295a402a09d3e4  fetchmail-6.4.3.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/36993086/
+sha256  511b60daabf7543a01de06af07c8772290c6807cd53c42a8504960e978f3abea  fetchmail-6.4.4.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1 14dbbad6714d3498920ed4058479a3ddf34fe96c  fetchmail-6.4.3.tar.xz
-md5 614d5a05ac9a042bfc9317e5499bafd4  fetchmail-6.4.3.tar.xz
+sha1  2e049aadf84ba327d585c34240f926f0b32b4dcc  fetchmail-6.4.4.tar.xz
+md5  53d52179c8bf8e2f57489538b49bfda9  fetchmail-6.4.4.tar.xz
 # Locally computed:
-sha256 89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
+sha256  89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 4b1aa645dd..136af260a2 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).3
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.17.1
