From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 19 Sep 2018 13:41:27 -0500
Subject: [Buildroot] [PATCH] boot/gummiboot: updated url
Message-ID: <1537382487-35071-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matt@thewebers.ws>

---
 boot/gummiboot/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/boot/gummiboot/Config.in b/boot/gummiboot/Config.in
index 11dbc4f..57d8d59 100644
--- a/boot/gummiboot/Config.in
+++ b/boot/gummiboot/Config.in
@@ -20,4 +20,5 @@ config BR2_TARGET_GUMMIBOOT
 	  exactly the same, except that the Gummiboot configuration
 	  files will be located in /loader/ inside the EFI partition.
 
-	  http://freedesktop.org/wiki/Software/gummiboot/
+          https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
+
-- 
1.9.1
