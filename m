From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 28 Nov 2014 09:25:05 -0600
Subject: [Buildroot] [PATCH v3 2/3] manual: reinstall targets
In-Reply-To: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
References: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1417188306-9035-3-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add reinstall target information to package-make-target.txt.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 docs/manual/package-make-target.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 25d3f44..0f0aced 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -77,4 +77,18 @@ directly in the build directory
 makes sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a
 file directly in the build directory
 
+| +reinstall-staging+ |
+*target package:* Re-run the installation of the package in the staging
+directory - this only makes sense when overriding +STAGING_DIR+
+
+| +reinstall-target+  |
+*target package:* Re-run the installation of the package in the target
+directory - this only makes sense when overriding +TARGET_DIR+
+
+| +reinstall+         |
+*target package:* Run the 2 previous re-installation commands
+
+*host package:* Re-run the installation of the package in the host
+directory
+
 |===================================================
-- 
1.9.1
