From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:55:26 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/dovecot-pigeonhole: bump version to 0.5.10
Message-ID: <20200828174822.7781186502@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72b1e417991426569194f5719768df0e12b4582e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Release notes:
https://raw.githubusercontent.com/dovecot/pigeonhole/release-0.5.10/NEWS

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 88aa55953cc384f78f34d384db6dbc1df7ebc409)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 4 ++--
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 28a49b13d6..f8e5f1e60f 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 36da68aae5157b83e21383f711b8977e5b6f5477f369f71e7e22e76a738bbd05  dovecot-2.3-pigeonhole-0.5.9.tar.gz
-sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
+sha256  48c89cc9f3caa9c5f2454f9dcca74fe251a99749a38062bfab7e5017d329605e  dovecot-2.3-pigeonhole-0.5.10.tar.gz
+sha256  fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 95bfa6fc4a..033ae980a5 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.9
+DOVECOT_PIGEONHOLE_VERSION = 0.5.10
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
