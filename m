From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed,  7 Jan 2015 23:45:16 +0100
Subject: [Buildroot] [PATCH 2/2] libqmi: bump to 1.10.6
In-Reply-To: <1420670716-2776-1-git-send-email-yegorslists@googlemail.com>
References: <1420670716-2776-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1420670716-2776-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add locally computed hash file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libqmi/libqmi.hash | 2 ++
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libqmi/libqmi.hash

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
new file mode 100644
index 0000000..a42aebc
--- /dev/null
+++ b/package/libqmi/libqmi.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  963cce068968d749e22973dce0afc05543915e4accea736963a7d426f6b29a80  libqmi-1.10.6.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index b083aea..dd87d73 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.10.4
+LIBQMI_VERSION = 1.10.6
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
1.9.1
