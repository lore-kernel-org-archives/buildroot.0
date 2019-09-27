From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 27 Sep 2019 22:14:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.0
Message-ID: <20190927201429.27142-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added hashes provided by upstream.

Updated license hash after upstream commit:
https://sourceforge.net/p/fetchmail/git/ci/51ea9ddcef4b0e513a493f62a4bd93e41ff201ea/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/fetchmail.hash | 7 +++++--
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index e215781d8a..3bc9c5a798 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,3 +1,6 @@
+# From https://sourceforge.net/p/fetchmail/mailman/message/36773211/
+sha1 323d97096e3cbdf0699c923f973f0bb95c20bb29  fetchmail-6.4.0.tar.xz
+sha256 8b30e2e43744be3b7caa6490dc969630dae59dfcc65d508bddc43b1463193072  fetchmail-6.4.0.tar.xz
+sha512 45344d542b8312f4beb9fe7d99b3547f5a80447f7af6af3cd28c9d27ac104b505a25fc8e802b51ed6301df8b1ffd171ef92de19f0a83715b4dab6fc46f7cf1d5  fetchmail-6.4.0.tar.xz
 # Locally computed:
-sha256 8b6c7c113b58ca32b3041375bdab4b2e4e6e98c975e1365de5e51f63ef07bf2e  fetchmail-6.4.0.rc1.tar.xz
-sha256 678189d91119286a3499874421006bb81f49b13eff8e1223115ce1b07e7ed0e7  COPYING
+sha256 89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index 1d3918ac90..9ff50d61c6 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0.rc1
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).0
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.20.1
