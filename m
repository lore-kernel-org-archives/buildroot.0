From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed,  7 Mar 2012 21:58:21 +0100
Subject: [Buildroot] [RFC v2 21/31] iostat: define license
In-Reply-To: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1331153911-22277-22-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/iostat/iostat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 83eea07..97b4cac 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -6,6 +6,8 @@
 
 IOSTAT_VERSION = 2.2
 IOSTAT_SITE = http://www.linuxinsight.com/files
+IOSTAT_LICENSE = GPLv2
+IOSTAT_LICENSE_FILE = LICENSE
 
 iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
 
-- 
1.7.5.4
