From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue,  1 Mar 2016 11:08:07 +0100
Subject: [Buildroot] [PATCH] CHANGES: fix typo
Message-ID: <1456826887-12163-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Peter Korsgaard <peter@korsgaard.com>

---
Peter, still in time for the release?
---
 CHANGES | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index a4e22f8..943047a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -67,7 +67,7 @@
 	A number of defconfigs have been extended to generate complete
 	system images using genimage.
 
-	Linux: Authomatically patch timeconst.pl for <3.9 kernels,
+	Linux: Automatically patch timeconst.pl for <3.9 kernels,
 	which isn't compatible with modern perl versions, breaking the
 	build when building on recent (Fedora 23, Debian
 	Testing/Unstable, ..) distributions.
-- 
1.9.1
