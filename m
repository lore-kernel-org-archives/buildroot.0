From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  6 Mar 2019 18:24:22 +0100
Subject: [Buildroot] [PATCH 2/2] dovecot-pigeonhole: bump version to 0.5.5
In-Reply-To: <20190306172422.7238-1-bernd.kuhls@t-online.de>
References: <20190306172422.7238-1-bernd.kuhls@t-online.de>
Message-ID: <20190306172422.7238-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://www.dovecot.org/list/dovecot-news/2019-March/000400.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 5ad9406ad2..a1d88d49e2 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 547999e67a001abc5e654c7e35653d3fe057fa9a47a24257e39a79c41ef08516  dovecot-2.3-pigeonhole-0.5.4.tar.gz
+sha256 cbaa106e1c2b23824420efdd6a9f8572c64c8dccf75a3101a899b6ddb25149a5  dovecot-2.3-pigeonhole-0.5.5.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 184204673b..2a7626733f 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.4
+DOVECOT_PIGEONHOLE_VERSION = 0.5.5
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
-- 
2.20.1
