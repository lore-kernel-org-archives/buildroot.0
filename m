From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Mar 2018 18:38:15 +0100
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
 0.4.23
In-Reply-To: <20180320173815.18004-1-bernd.kuhls@t-online.de>
References: <20180320173815.18004-1-bernd.kuhls@t-online.de>
Message-ID: <20180320173815.18004-2-bernd.kuhls@t-online.de>
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
index a2b7eba9de..797530f526 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 4ae09cb788c5334d167f5a89ee70b0616c3231e5904ad258ce408e4953cfdd6a  dovecot-2.2-pigeonhole-0.4.21.tar.gz
+sha256 2860d12b95e316bddfae00d887edcd9834272834406970aa1c096425569c035f  dovecot-2.2-pigeonhole-0.4.23.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index ea8b0077f0..919c58e3e8 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.21
+DOVECOT_PIGEONHOLE_VERSION = 0.4.23
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.11.0
