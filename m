From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:21 +0100
Subject: [Buildroot] [PATCH 31/33] owl-linux: add license info
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-32-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/owl-linux/owl-linux.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
index 0a111c8..e5846a4 100644
--- a/package/owl-linux/owl-linux.mk
+++ b/package/owl-linux/owl-linux.mk
@@ -5,6 +5,8 @@
 #############################################################
 OWL_LINUX_VERSION = 1.0.7
 OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
+OWL_LINUX_LICENSE = as-is
+OWL_LINUX_LICENSE_FILES = LICENSE
 
 OWL_LINUX_DEPENDENCIES = linux
 
-- 
1.8.0
