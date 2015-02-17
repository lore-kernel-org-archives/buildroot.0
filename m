From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Feb 2015 14:02:51 +0100
Subject: [Buildroot] [git commit] libnspr: bump to version 4.10.8
Message-ID: <20150302222718.E7F8A807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f828739a5b71cc837b1f49acbf82ceaa9b1cee53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libnspr/libnspr.hash |    2 ++
 package/libnspr/libnspr.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
new file mode 100644
index 0000000..632422f
--- /dev/null
+++ b/package/libnspr/libnspr.hash
@@ -0,0 +1,2 @@
+# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.10.8/src/SHA256SUMS
+sha256	507ea57c525c0c524dae4857a642b4ef5c9d795518754c7f83422d22fe544a15	nspr-4.10.8.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index c4f86cc..91a740a 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.10.7
+LIBNSPR_VERSION = 4.10.8
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
