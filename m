From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 27 Jun 2017 06:38:09 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
	0.4.19
In-Reply-To: <20170627043809.30458-1-bernd.kuhls@t-online.de>
References: <20170627043809.30458-1-bernd.kuhls@t-online.de>
Message-ID: <20170627043809.30458-2-bernd.kuhls@t-online.de>
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
index 84b260b22..137870f98 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 dd871bb57fad22795460f613f3c9484a8bf229272ac00956d837a34444f1c3a9  dovecot-2.2-pigeonhole-0.4.18.tar.gz
+sha256 629204bfbdcd3480e1ebcdc246da438323c3ea5fea57480ab859e8b201ad8793  dovecot-2.2-pigeonhole-0.4.19.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index af330d0e0..6b835d3b1 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.18
+DOVECOT_PIGEONHOLE_VERSION = 0.4.19
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.11.0
