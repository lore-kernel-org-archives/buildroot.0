From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:58 -0500
Subject: [Buildroot] [PATCH 13/14] package/alljoyn-base: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-13-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/alljoyn-base/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alljoyn-base/Config.in b/package/alljoyn-base/Config.in
index 8556d66..c89cb20 100644
--- a/package/alljoyn-base/Config.in
+++ b/package/alljoyn-base/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_ALLJOYN_BASE
 	  devices, providing a set of interfaces for different devices
 	  to interact and interoperate with one another.
 
-	  https://allseenalliance.org
+	  https://github.com/alljoyn/alljoyn.github.com/wiki
 
 if BR2_PACKAGE_ALLJOYN_BASE
 
-- 
1.9.1
