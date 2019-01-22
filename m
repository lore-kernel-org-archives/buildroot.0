From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 22 Jan 2019 07:48:43 -0600
Subject: [Buildroot] [PATCH] package/openresolv: updated webpage URL
Message-ID: <1548164923-15879-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated URL to point at the project page vs just the GIT repository
containing the source code.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/openresolv/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openresolv/Config.in b/package/openresolv/Config.in
index 2a393c6..835fbf2 100644
--- a/package/openresolv/Config.in
+++ b/package/openresolv/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_OPENRESOLV
 	  manages resolv.conf. This tool provides a dns management
 	  framework to track currently available nameservers.
 
-	  https://github.com/rsmarples/openresolv
+	  https://roy.marples.name/projects/openresolv
-- 
1.9.1
