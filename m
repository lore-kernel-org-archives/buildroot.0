From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Jun 2015 11:10:31 +0200
Subject: [Buildroot] [PATCH 2/4] package/kodi: Move all kodi packages to
	subdirectories of package/kodi/, part II
In-Reply-To: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
References: <1434273033-31723-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1434273033-31723-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch needs to be squashed with the previous patch.
In this patch series it is presented as a seperate patch for easier review.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk |    1 +
 1 file changed, 1 insertion(+)
 create mode 100644 package/kodi/kodi.mk

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
new file mode 100644
index 0000000..cc72284
--- /dev/null
+++ b/package/kodi/kodi.mk
@@ -0,0 +1 @@
+include $(sort $(wildcard package/kodi/*/*.mk))
-- 
1.7.10.4
