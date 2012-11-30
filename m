From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:32 +0100
Subject: [Buildroot] [PATCH v2] owl-linux: add license info
In-Reply-To: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
References: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354311995-21598-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
v2: fix license according to Arnout's comments
---
 package/owl-linux/owl-linux.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
index 0a111c8..832f6b1 100644
--- a/package/owl-linux/owl-linux.mk
+++ b/package/owl-linux/owl-linux.mk
@@ -5,6 +5,9 @@
 #############################################################
 OWL_LINUX_VERSION = 1.0.7
 OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
+OWL_LINUX_LICENSE = PROPRIETARY
+OWL_LINUX_LICENSE_FILES = LICENSE
+OWL_LINUX_REDISTRIBUTE = NO
 
 OWL_LINUX_DEPENDENCIES = linux
 
-- 
1.8.0.1
