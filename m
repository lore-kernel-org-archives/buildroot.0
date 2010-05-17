From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 May 2010 09:34:47 +0200
Subject: [Buildroot] [git commit master] Config: terminate version number
	string
Message-ID: <20100517075657.D516299B11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=acb785cad4d34cdb501a5ebd48712478c88905bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index debac20..53aed90 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-rc2-git
+	default "2010.05-rc2-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.6.3.3
