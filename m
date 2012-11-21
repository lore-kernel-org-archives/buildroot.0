From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Nov 2012 11:04:22 +0100
Subject: [Buildroot] [git commit] barebox: Add BR2_TARGET_BAREBOX_2012_11
Message-ID: <20121121101538.CC947953ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c60854f00a687f25f6012c960c202bfd0cc6455
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index c9e7088..997f45b 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -45,6 +45,7 @@ config BR2_TARGET_BAREBOX_VERSION
 	default "2012.08.0"	if BR2_TARGET_BAREBOX_2012_08
 	default "2012.09.0"	if BR2_TARGET_BAREBOX_2012_09
 	default "2012.10.0"	if BR2_TARGET_BAREBOX_2012_10
+	default "2012.11.0"	if BR2_TARGET_BAREBOX_2012_11
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default $BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
 
