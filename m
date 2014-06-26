From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:02:23 +0200
Subject: [Buildroot] [git commit] statserial: add license information
Message-ID: <20140626151144.4BF059D0D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a5680db2798367cf1067226ea9b843b0fe350c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/statserial/statserial.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
index 25989bc..e59267a 100644
--- a/package/statserial/statserial.mk
+++ b/package/statserial/statserial.mk
@@ -7,6 +7,8 @@
 STATSERIAL_VERSION = 1.1
 STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
 STATSERIAL_DEPENDENCIES = ncurses
+STATSERIAL_LICENSE = GPLv2+
+STATSERIAL_LICENSE_FILES = COPYING
 
 define STATSERIAL_BUILD_CMDS
 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
