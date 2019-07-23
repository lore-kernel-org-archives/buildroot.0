From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 23 Jul 2019 18:27:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: bump version to
 0.5.7.1
In-Reply-To: <20190723162752.17367-1-bernd.kuhls@t-online.de>
References: <20190723162752.17367-1-bernd.kuhls@t-online.de>
Message-ID: <20190723162752.17367-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://dovecot.org/pipermail/dovecot/2019-July/116622.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 7d215c88e7..6435aa9ccf 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 783849542c272331f60e7c4d371b303f7f2b1d69828bced3094a898876ecdb63  dovecot-2.3-pigeonhole-0.5.7.tar.gz
+sha256 3270b24c1f75a7c144f54d6d08ce994176e39c2cdb3ac4dd80ad5e64aaaa2028  dovecot-2.3-pigeonhole-0.5.7.1.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 532d3e6e3b..ecde286ffa 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.7
+DOVECOT_PIGEONHOLE_VERSION = 0.5.7.1
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.20.1
