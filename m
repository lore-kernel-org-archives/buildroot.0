From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 09:44:11 +0200
Subject: [Buildroot] [git commit] package/zic: bump version, add hash
Message-ID: <20150419074553.9FCC87FB27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a5dca03308cc6601c5bb796480bf0597cb912eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zic/zic.hash |    2 ++
 package/zic/zic.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/zic/zic.hash b/package/zic/zic.hash
new file mode 100644
index 0000000..6f7911a
--- /dev/null
+++ b/package/zic/zic.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  7feeb1a60dff8b179c884f6e3aa7684606f4eaeb7f7ecc61a6bb81e3e38af42e  tzcode2015c.tar.gz
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index d9d8523..5e84567 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2014d
+ZIC_VERSION = 2015c
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = ftp://ftp.iana.org/tz/releases
 ZIC_LICENSE = Public domain
