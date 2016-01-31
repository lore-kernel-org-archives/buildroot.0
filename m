From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 10:10:13 +0100
Subject: [Buildroot] [git commit] package/input-tools: fix broken download
	URL
Message-ID: <20160201224702.65D8F7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92500f911a3388727fd429ffb653c5d277c9f634
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/input-tools/input-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index c70ef47..81e913d 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -7,7 +7,7 @@
 INPUT_TOOLS_VERSION = 20051019
 INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
 INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
-INPUT_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/joystick
+INPUT_TOOLS_SITE = http://snapshot.debian.org/archive/debian/20101023T043132Z/pool/main/j/joystick
 INPUT_TOOLS_LICENSE = GPLv2+
 INPUT_TOOLS_LICENSE_FILES = utils/Makefile
 
