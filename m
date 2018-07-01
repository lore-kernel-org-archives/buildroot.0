From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Jul 2018 14:55:13 +0200
Subject: [Buildroot] [PATCH 1/2] package/dovecot-pigeonhole: bump version to
 0.5.2
Message-ID: <20180701125514.28232-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https.

Release notes:
https://www.dovecot.org/list/dovecot-news/2018-June/000384.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 2950476102..8d34ee2d48 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 e3b0aa59261881bcb0d33a6c398f3cb5f9f75e077e67bae175cf33c362577547  dovecot-2.3-pigeonhole-0.5.1.tar.gz
+sha256 950e8e15c58e539761255e140dd3678dd2477fa432a5f2b804e53821bdc02535  dovecot-2.3-pigeonhole-0.5.2.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index f70ae5c02d..f78b1acccc 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.1
+DOVECOT_PIGEONHOLE_VERSION = 0.5.2
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
-DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.3
+DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
 DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
 DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
-- 
2.17.1
