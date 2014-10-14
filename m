From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:54:02 -0300
Subject: [Buildroot] [PATCH 4/6] libcdio: bump to version 0.93
In-Reply-To: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284044-20381-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcdio/libcdio.hash | 2 ++
 package/libcdio/libcdio.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libcdio/libcdio.hash

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
new file mode 100644
index 0000000..cc87ffb
--- /dev/null
+++ b/package/libcdio/libcdio.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking signature
+sha256	4972cd22fd8d0e8bff922d35c7a645be0db0ab0e7b3dfaecc9cd8272429d6975	libcdio-0.93.tar.gz
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index 10559a7..03e6002 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 0.92
+LIBCDIO_VERSION = 0.93
 LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPLv3+
-- 
2.0.4
