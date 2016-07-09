From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  9 Jul 2016 11:05:42 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
	0.4.15
In-Reply-To: <1468055142-25124-1-git-send-email-bernd.kuhls@t-online.de>
References: <1468055142-25124-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1468055142-25124-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 2ef063e..f598825 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	dff30a636c1516158f3e159c669a254569c9dabaa6ecfa3669379101ea5b3300	dovecot-2.2-pigeonhole-0.4.14.tar.gz
+sha256	c99ace6ead310c6c3b639922da618f90d846307da4fe252d994e5e51bf8a3de3	dovecot-2.2-pigeonhole-0.4.15.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 132bef4..7c0a14c 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.14
+DOVECOT_PIGEONHOLE_VERSION = 0.4.15
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
-- 
2.8.1
