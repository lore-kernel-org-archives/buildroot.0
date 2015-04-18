From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Apr 2015 19:44:21 +0200
Subject: [Buildroot] [PATCH 1/2] package/zic: bump version, add hash
In-Reply-To: <cover.1429379016.git.yann.morin.1998@free.fr>
References: <cover.1429379016.git.yann.morin.1998@free.fr>
Message-ID: <d5474319f23c8c914178f9652b8e5bc03e9ea0c6.1429379016.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/zic/zic.hash | 2 ++
 package/zic/zic.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/zic/zic.hash

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
-- 
1.9.1
