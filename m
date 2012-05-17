From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:15 +0200
Subject: [Buildroot] [PATCH v4 16/22] iostat: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-17-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/iostat/iostat.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 83eea07..6f2e8aa 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -6,6 +6,8 @@
 
 IOSTAT_VERSION = 2.2
 IOSTAT_SITE = http://www.linuxinsight.com/files
+IOSTAT_LICENSE = GPL
+IOSTAT_LICENSE_FILES = LICENSE
 
 iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
 
-- 
1.7.9.5
