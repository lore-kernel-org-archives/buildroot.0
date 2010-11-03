From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 4 Nov 2010 00:03:52 +0100
Subject: [Buildroot] [git commit master 1/1] config: use global version
	string
Message-ID: <20101103230450.523208A5A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=56c68bcd3f79223380d3b0a8e9d1267ab8ef68b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Config.in b/Config.in
index 8107296..b37102d 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	option env="BR2_VERSION"
+	option env="BR2_VERSION_FULL"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
-- 
1.7.1
