From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:54 -0500
Subject: [Buildroot] [PATCH 09/14] package/connman: URL move to newline
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-9-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allows scripting of URL checking to be simplier

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/connman/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 253c604..0f93fee 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -14,7 +14,8 @@ config BR2_PACKAGE_CONNMAN
 	  for managing internet connections within embedded devices
 	  running the Linux operating system.
 
-	  For more information, see https://01.org/connman
+	  For more information, see
+	  https://01.org/connman
 
 if BR2_PACKAGE_CONNMAN
 
-- 
1.9.1
