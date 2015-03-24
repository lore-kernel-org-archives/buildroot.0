From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 24 Mar 2015 22:34:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: bump version to
	0.4.7
Message-ID: <1427232867-1030-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index e4a2dff..fde95e8 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.6
+DOVECOT_PIGEONHOLE_VERSION = 0.4.7
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
-- 
1.7.10.4
