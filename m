From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Feb 2013 09:19:02 +0100
Subject: [Buildroot] [git commit] libatasmart: move under
	libraries->hardware handling
Message-ID: <20130206082131.564E39A9BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b243cbb0f4f84fa12dc8bba632e3c05e568d2786
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is a library, so it should go under libraries.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2f219b6..8588951 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -247,7 +247,6 @@ source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
-source "package/libatasmart/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
@@ -447,6 +446,7 @@ source "package/ccid/Config.in"
 source "package/imx-lib/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
+source "package/libatasmart/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
 source "package/libfreefare/Config.in"
