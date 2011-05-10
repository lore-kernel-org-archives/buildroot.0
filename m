From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 10 May 2011 23:43:00 +0200
Subject: [Buildroot] [git commit] haserl: bump 0.9.x version
Message-ID: <20110510215122.19E7083463@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6e850246252e4978d93469a8998bf8343bab0340
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes off-by-1 buffer overflow.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/haserl/Config.in b/package/haserl/Config.in
index ad9a8e9..7710fa1 100644
--- a/package/haserl/Config.in
+++ b/package/haserl/Config.in
@@ -38,4 +38,4 @@ endchoice
 config BR2_PACKAGE_HASERL_VERSION
 	string
 	default "0.8.0"		if BR2_PACKAGE_HASERL_VERSION_0_8_X
-	default "0.9.28"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
+	default "0.9.29"	if BR2_PACKAGE_HASERL_VERSION_0_9_X
-- 
1.7.3.4
