From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:08:46 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/dovecot-pigeonhole: bump version to 0.5.7
Message-ID: <20190902161353.B231E86602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45d6a593540f67bcde74fa63516b7dd2f24ed042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Release notes:
https://dovecot.org/pipermail/dovecot-news/2019-July/000413.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 29367651e045766545a82f197a4a7199f5dd5518)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index f2b8720c63..7d215c88e7 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 7c2fe7e23e732a8451172c00da5f19532448c95e03e44d47c61b123e8210f5b8  dovecot-2.3-pigeonhole-0.5.6.tar.gz
+sha256 783849542c272331f60e7c4d371b303f7f2b1d69828bced3094a898876ecdb63  dovecot-2.3-pigeonhole-0.5.7.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 1568cbc14d..532d3e6e3b 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.6
+DOVECOT_PIGEONHOLE_VERSION = 0.5.7
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
