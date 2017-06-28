From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 23:28:17 +0200
Subject: [Buildroot] [git commit] package/dovecot-pigeonhole: bump version
	to 0.4.19
Message-ID: <20170628212845.C0AF5800A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8398230bc7d81540f2d2e99ad9ab1f83879e4ecd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 84b260b..137870f 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 dd871bb57fad22795460f613f3c9484a8bf229272ac00956d837a34444f1c3a9  dovecot-2.2-pigeonhole-0.4.18.tar.gz
+sha256 629204bfbdcd3480e1ebcdc246da438323c3ea5fea57480ab859e8b201ad8793  dovecot-2.2-pigeonhole-0.4.19.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index af330d0..6b835d3 100644
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
