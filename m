From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 23 Sep 2020 23:04:43 +0200
Subject: [Buildroot] [git commit] Config.in.legacy: fix spelling of 'config'
Message-ID: <20200923205607.8F9338D4BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e4be4677151f429bf31561f0d27b5bbd299c0df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c1b3e18186..92816e562d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,7 +146,7 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
-connfig BR2_PACKAGE_GST1_VALIDATE
+config BR2_PACKAGE_GST1_VALIDATE
 	bool "gst1-validate was moved to gst1-devtools"
 	select BR2_PACKAGE_GST1_DEVTOOLS
 	select BR2_LEGACY
