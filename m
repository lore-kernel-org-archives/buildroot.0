From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Jan 2016 21:20:16 +0100
Subject: [Buildroot] [git commit] package/elementary: bump to 1.15.3
Message-ID: <20160119202027.F221A801DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73753e50123813daf2ab01a5aee3dde5216119cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elementary/elementary.hash | 4 ++--
 package/elementary/elementary.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/elementary/elementary.hash b/package/elementary/elementary.hash
index 2cd36d8..ecdbc8e 100644
--- a/package/elementary/elementary.hash
+++ b/package/elementary/elementary.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.15.2.tar.xz.sha256
-sha256	523c3073210b611817d0f56aa8348962ec757282f9f7dfde93825afa164a0f3f	elementary-1.15.2.tar.xz
+# From https://download.enlightenment.org/rel/libs/elementary/elementary-1.15.3.tar.xz.sha256
+sha256	474a9175061021ce8cbcfdbde6162316fc0d927b21118d1ab549377ebc802a93	elementary-1.15.3.tar.xz
diff --git a/package/elementary/elementary.mk b/package/elementary/elementary.mk
index 57da1e0..7de0c7b 100644
--- a/package/elementary/elementary.mk
+++ b/package/elementary/elementary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELEMENTARY_VERSION = 1.15.2
+ELEMENTARY_VERSION = 1.15.3
 ELEMENTARY_SOURCE = elementary-$(ELEMENTARY_VERSION).tar.xz
 ELEMENTARY_SITE = http://download.enlightenment.org/rel/libs/elementary
 ELEMENTARY_LICENSE = LGPLv2.1
