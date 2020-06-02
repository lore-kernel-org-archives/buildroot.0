From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:26:36 +0200
Subject: [Buildroot] [git commit] package/fetchmail: bump version to 6.4.6
Message-ID: <20200602212835.0C9B182966@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c084b31e7d27720d15ab9cc811e681d3316002f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fetchmail/fetchmail.hash | 8 ++++----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index c5670a0f7a..c9d9f4a466 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/36993086/
-sha256  511b60daabf7543a01de06af07c8772290c6807cd53c42a8504960e978f3abea  fetchmail-6.4.4.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/37024049
+sha256  16efec4b6019b4d2b6e43ed1d4f523dee019ac86754de856d0cf34d503d66011  fetchmail-6.4.6.tar.xz
 # From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
-sha1  2e049aadf84ba327d585c34240f926f0b32b4dcc  fetchmail-6.4.4.tar.xz
-md5  53d52179c8bf8e2f57489538b49bfda9  fetchmail-6.4.4.tar.xz
+sha1  7d2e440c94f98fcb44212314665bf8572182d24c  fetchmail-6.4.6.tar.xz
+md5  e6621616ccbde3792f6a3ccc85681fa9  fetchmail-6.4.6.tar.xz
 # Locally computed:
 sha256  89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 136af260a2..eaf6724fca 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).4
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).6
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
