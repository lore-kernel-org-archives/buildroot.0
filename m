From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 11 Oct 2015 12:21:10 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
	0.4.9
In-Reply-To: <1444558870-29918-1-git-send-email-bernd.kuhls@t-online.de>
References: <1444558870-29918-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1444558870-29918-2-git-send-email-bernd.kuhls@t-online.de>
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
index ac94e41..1371492 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	d73c1c5a11cdfdcb58304a1c1272cce6c8e1868e3f61d393b3b8a725f3bf665b	dovecot-2.2-pigeonhole-0.4.8.tar.gz
+sha256	82892f876d26008a076973dfddf1cffaf5a0451825fd44e06287e94b89078649	dovecot-2.2-pigeonhole-0.4.9.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 5e6504e..06ff2f1 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.8
+DOVECOT_PIGEONHOLE_VERSION = 0.4.9
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
-- 
2.6.1
