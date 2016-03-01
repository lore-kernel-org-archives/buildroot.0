From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Mar 2016 11:23:34 +0100
Subject: [Buildroot] [git commit] CHANGES: fix typo
Message-ID: <20160301104143.64DA280428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b186e089df052f1d5d84c71ff5db97505e903fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Peter Korsgaard <peter@korsgaard.com>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
