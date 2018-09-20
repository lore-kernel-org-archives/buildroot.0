From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 20 Sep 2018 08:24:59 -0500
Subject: [Buildroot] [PATCH 14/14] package/alljoyn-tcl-base: URL update
In-Reply-To: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1537449899-9576-14-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 package/alljoyn-tcl-base/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/alljoyn-tcl-base/Config.in b/package/alljoyn-tcl-base/Config.in
index ebc3370..404957a 100644
--- a/package/alljoyn-tcl-base/Config.in
+++ b/package/alljoyn-tcl-base/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_ALLJOYN_TCL_BASE
 	  AllJoyn distributed programming environment to embedded
 	  systems.
 
-	  https://allseenalliance.org
+	  https://github.com/alljoyn/alljoyn.github.com/wiki
 
 comment "alljoyn-tcl-base needs a toolchain w/ threads and dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
1.9.1
