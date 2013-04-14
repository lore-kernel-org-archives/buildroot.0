From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Apr 2013 21:23:39 -0300
Subject: [Buildroot] [PATCH 2/4] openssh: bump to version 6.2p1
In-Reply-To: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365899021-7675-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365899021-7675-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.5
