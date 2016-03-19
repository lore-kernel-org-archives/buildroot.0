From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Mar 2016 21:00:21 +0100
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
	0.4.13
In-Reply-To: <1458417621-7580-1-git-send-email-bernd.kuhls@t-online.de>
References: <1458417621-7580-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1458417621-7580-2-git-send-email-bernd.kuhls@t-online.de>
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
index 942046b..9646072 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	98a2fd79b0d9effd08c0caf04d483b1caa5e4503dae811e6d436948557bfb702	dovecot-2.2-pigeonhole-0.4.12.tar.gz
+sha256	7fd187b8393a5048b302f90ad84adc7bf6e73bf79fd8d22a1c1aaa71f836a910	dovecot-2.2-pigeonhole-0.4.13.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 2b8232d..b85a8f1 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.12
+DOVECOT_PIGEONHOLE_VERSION = 0.4.13
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
-- 
2.7.0
