From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2012 11:17:12 +0100
Subject: [Buildroot] [git commit] Remove unused barebox 2012.07 string
Message-ID: <20121121101730.2B12590A5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f717d54ba37d289e9e15b2a302cd4d2fe3fb93c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index 997f45b..95f330f 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -41,7 +41,6 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2012.07.0"	if BR2_TARGET_BAREBOX_2012_07
 	default "2012.08.0"	if BR2_TARGET_BAREBOX_2012_08
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
