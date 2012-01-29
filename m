From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:44 +0100
Subject: [Buildroot] [RFC 11/15] iostat: define license
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-12-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/iostat/iostat.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 83eea07..52b7e08 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -6,6 +6,7 @@
 
 IOSTAT_VERSION = 2.2
 IOSTAT_SITE = http://www.linuxinsight.com/files
+IOSTAT_LICENSE = GPL_V2
 
 iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
 
-- 
1.7.5.4
