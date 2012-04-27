From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Apr 2012 07:30:31 -0300
Subject: [Buildroot] [PATCH 1/2] openssh: bump to version 6.0p1
Message-ID: <1335522632-12572-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 08bb499..2b93def 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-OPENSSH_VERSION = 5.9p1
+OPENSSH_VERSION = 6.0p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --libexecdir=/usr/lib --disable-lastlog --disable-utmp \
-- 
1.7.3.4
