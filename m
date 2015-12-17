From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 17 Dec 2015 16:39:53 +0000
Subject: [Buildroot] [PATCH 1/2] Config.in: Introduce a new
	BR2_DEPRECATED_SINCE_2015_11 variable
Message-ID: <1450370394-51267-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Config.in b/Config.in
index 1809eeb..0be44d9 100644
--- a/Config.in
+++ b/Config.in
@@ -337,6 +337,10 @@ config BR2_DEPRECATED_SINCE_2015_08
 	bool
 	default y
 
+config BR2_DEPRECATED_SINCE_2015_11
+	bool
+	default y
+
 endif
 
 config BR2_ENABLE_DEBUG
-- 
2.4.10
