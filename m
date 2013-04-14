From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Apr 2013 20:36:59 +0200
Subject: [Buildroot] [git commit] openssh: bump to version 6.2p1
Message-ID: <20130414184111.329B99B62E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9d3e3cbd46ee5d957e6d5ecf114a257cfbbafd0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssh/openssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 03ea73d..3c29971 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSH_VERSION = 6.1p1
+OPENSSH_VERSION = 6.2p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
