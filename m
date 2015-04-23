From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Apr 2015 02:49:30 -0300
Subject: [Buildroot] [PATCH] ntfs-3g: bump to version 2015.3.14
Message-ID: <1429768170-6430-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntfs-3g/ntfs-3g.hash | 2 ++
 package/ntfs-3g/ntfs-3g.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/ntfs-3g/ntfs-3g.hash

diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
new file mode 100644
index 0000000..1c3445b
--- /dev/null
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	97f996015d8316d4a272bd2629978e5e97072dd3cc148ce39802f8037c6538f2	ntfs-3g_ntfsprogs-2015.3.14.tgz
diff --git a/package/ntfs-3g/ntfs-3g.mk b/package/ntfs-3g/ntfs-3g.mk
index 708e590..95e3db4 100644
--- a/package/ntfs-3g/ntfs-3g.mk
+++ b/package/ntfs-3g/ntfs-3g.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NTFS_3G_VERSION = 2014.2.15
+NTFS_3G_VERSION = 2015.3.14
 NTFS_3G_SOURCE = ntfs-3g_ntfsprogs-$(NTFS_3G_VERSION).tgz
 NTFS_3G_SITE = http://tuxera.com/opensource
 NTFS_3G_CONF_OPTS = --disable-ldconfig
-- 
2.0.5
