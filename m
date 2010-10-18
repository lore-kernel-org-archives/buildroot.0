From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Oct 2010 11:30:31 +0200
Subject: [Buildroot] [git commit master 1/1] haserl: bump 0.9.x version
Message-ID: <20101018093103.2CBB78C9AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=60f52cbd7469a09cc046f1d7cbe01dab5de28700
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index a8d2ee5..23101c4 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -38,4 +38,4 @@ endchoice
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.26"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.27"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
-- 
1.7.1
