From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Dec 2015 19:31:40 +0100
Subject: [Buildroot] [PATCH 5/8] package/dovecot-pigeonhole: bum version to
	0.4.10.rc2
In-Reply-To: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
References: <1449945103-23715-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1449945103-23715-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for Dovecot 2.2.21

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 1371492..58f4196 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	82892f876d26008a076973dfddf1cffaf5a0451825fd44e06287e94b89078649	dovecot-2.2-pigeonhole-0.4.9.tar.gz
+sha256	7fd01d731b264703fb6d965400f8e3e660841cd51cf7cec1fd648c1326fe0b77	dovecot-2.2-pigeonhole-0.4.10.rc2.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 06ff2f1..e65a2a9 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.9
+DOVECOT_PIGEONHOLE_VERSION = 0.4.10.rc2
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
-DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
+DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2/rc
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
 DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
 DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
-- 
2.6.2
