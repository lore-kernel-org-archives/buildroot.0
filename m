From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Jun 2013 14:23:26 +0200
Subject: [Buildroot] [git commit] openssh: bump to version 6.2p2
Message-ID: <20130627122815.2E91B9A4D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=464b525757602e37df641e7eb912baf7282b23fb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssh/openssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 006d597..4a5b125 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.2p1
+OPENSSH_VERSION = 6.2p2
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
