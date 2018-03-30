From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 30 Mar 2018 11:17:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
 0.5.1
In-Reply-To: <20180330091739.27675-1-bernd.kuhls@t-online.de>
References: <20180330091739.27675-1-bernd.kuhls@t-online.de>
Message-ID: <20180330091739.27675-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 797530f526..2950476102 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 2860d12b95e316bddfae00d887edcd9834272834406970aa1c096425569c035f  dovecot-2.2-pigeonhole-0.4.23.tar.gz
+sha256 e3b0aa59261881bcb0d33a6c398f3cb5f9f75e077e67bae175cf33c362577547  dovecot-2.3-pigeonhole-0.5.1.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 919c58e3e8..f70ae5c02d 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.23
-DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
-DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
+DOVECOT_PIGEONHOLE_VERSION = 0.5.1
+DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
+DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
 DOVECOT_PIGEONHOLE_LICENSE_FILES = COPYING
 DOVECOT_PIGEONHOLE_DEPENDENCIES = dovecot
-- 
2.14.2
