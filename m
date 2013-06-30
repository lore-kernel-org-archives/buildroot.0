From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 10:20:35 +0200
Subject: [Buildroot] [git commit] haserl: bump 0.9.x version
Message-ID: <20130630082440.CC48C9B16C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b2ae7feb1900e456757ad6b55fc9314927e87a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../haserl-add-haserl_lualib.inc.patch}            |    0
 package/haserl/Config.in                           |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/haserl/0.9.29/haserl-0.9.29-add-haserl_lualib.inc.patch b/package/haserl/0.9.30/haserl-add-haserl_lualib.inc.patch
similarity index 100%
rename from package/haserl/0.9.29/haserl-0.9.29-add-haserl_lualib.inc.patch
rename to package/haserl/0.9.30/haserl-add-haserl_lualib.inc.patch
diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index 36bfca7..2d5cacf 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -39,4 +39,4 @@ endchoice
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.29"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.30"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
