From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Dec 2015 23:16:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/dovecot-pigeonhole: bump version to
	0.4.10
Message-ID: <1450131372-9640-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 58f4196..9500ab1 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	7fd01d731b264703fb6d965400f8e3e660841cd51cf7cec1fd648c1326fe0b77	dovecot-2.2-pigeonhole-0.4.10.rc2.tar.gz
+sha256	e9dfe7160fd3b465d6d5068f219122626ef790cce507e290cd09852c7d90726f	dovecot-2.2-pigeonhole-0.4.10.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index e65a2a9..d057c7a 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.10.rc2
+DOVECOT_PIGEONHOLE_VERSION = 0.4.10
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
-DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2/rc
+DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
 DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
 DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
-- 
2.6.2
