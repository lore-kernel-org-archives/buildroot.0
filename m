From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Nov 2017 07:51:51 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/dovecot-pigeonhole: bump
 version to 0.4.21
In-Reply-To: <20171114065151.24659-1-bernd.kuhls@t-online.de>
References: <20171114065151.24659-1-bernd.kuhls@t-online.de>
Message-ID: <20171114065151.24659-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 3 ++-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 137870f987..a2b7eba9de 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,3 @@
 # Locally computed after checking signature
-sha256 629204bfbdcd3480e1ebcdc246da438323c3ea5fea57480ab859e8b201ad8793  dovecot-2.2-pigeonhole-0.4.19.tar.gz
+sha256 4ae09cb788c5334d167f5a89ee70b0616c3231e5904ad258ce408e4953cfdd6a  dovecot-2.2-pigeonhole-0.4.21.tar.gz
+sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 6b835d3b19..ea8b0077f0 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.19
+DOVECOT_PIGEONHOLE_VERSION = 0.4.21
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.11.0
