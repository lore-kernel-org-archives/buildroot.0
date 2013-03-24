From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 14:06:41 +0100
Subject: [Buildroot] [git commit] toolchain: update crosstool-NG project URL
Message-ID: <20130324131004.6AFA69B26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c1eefa3986d19ffc93b3b9f3367fb2f68562b30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7edf82b..f1cca14 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -28,7 +28,7 @@ config BR2_TOOLCHAIN_CTNG
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
-	  ( http://ymorin.is-a-geek.org/projects/crosstool )
+	  (http://crosstool-ng.org).
 
 	  This is considered experimental, and you can expect some breakage.
 
