From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2020 14:48:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.4.3
Message-ID: <20200410124841.3226726-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/fetchmail/fetchmail.hash | 9 +++++----
 package/fetchmail/fetchmail.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/fetchmail/fetchmail.hash b/package/fetchmail/fetchmail.hash
index 08a7a0ef48..e55aa5733c 100644
--- a/package/fetchmail/fetchmail.hash
+++ b/package/fetchmail/fetchmail.hash
@@ -1,6 +1,7 @@
-# From https://sourceforge.net/p/fetchmail/mailman/message/36773211/
-sha1 1aadf078ed8fb1b6c93e9126cc0375b1f740301a  fetchmail-6.4.1.tar.xz
-sha256 3f33f11dd08c3e8cc3e9d18eec686b1626d4818f4d5a72791507bbc4dce6a9a0  fetchmail-6.4.1.tar.xz
-sha512 940b8df52f963f71537962ebe2b2cb88298fd2b54ca79932e5c974abe850f0b59cdc4919d606ee4f210e82d1e0a6f090ea87f1d3bdea18b531d4fbb36f7f9ea0  fetchmail-6.4.1.tar.xz
+# From https://sourceforge.net/p/fetchmail/mailman/message/36971969/
+sha256 b0360e14b9aa5d065eef8ff99ad0347ef6cbbfc934c8114908295a402a09d3e4  fetchmail-6.4.3.tar.xz
+# From https://sourceforge.net/projects/fetchmail/files/branch_6.4/
+sha1 14dbbad6714d3498920ed4058479a3ddf34fe96c  fetchmail-6.4.3.tar.xz
+md5 614d5a05ac9a042bfc9317e5499bafd4  fetchmail-6.4.3.tar.xz
 # Locally computed:
 sha256 89d6efe79c78f965b256e007d6acc367fff982c59b6195fb6ec5895ea0fc9bd5  COPYING
diff --git a/package/fetchmail/fetchmail.mk b/package/fetchmail/fetchmail.mk
index b8e3c667e3..4b1aa645dd 100644
--- a/package/fetchmail/fetchmail.mk
+++ b/package/fetchmail/fetchmail.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FETCHMAIL_VERSION_MAJOR = 6.4
-FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).1
+FETCHMAIL_VERSION = $(FETCHMAIL_VERSION_MAJOR).3
 FETCHMAIL_SOURCE = fetchmail-$(FETCHMAIL_VERSION).tar.xz
 FETCHMAIL_SITE = http://downloads.sourceforge.net/project/fetchmail/branch_$(FETCHMAIL_VERSION_MAJOR)
 FETCHMAIL_LICENSE = GPL-2.0; some exceptions are mentioned in COPYING
-- 
2.25.0
