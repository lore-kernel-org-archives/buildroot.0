From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 16:10:02 +0100
Subject: [Buildroot] [git commit] package/dovecot-pigeonhole: bump version
 to 0.5.9
Message-ID: <20200104150915.C2AE78EBA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3d8097272329c6a901c91c2c43ad75513140fd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://dovecot.org/pipermail/dovecot-news/2019-December/000424.html
https://dovecot.org/pipermail/dovecot-news/2019-October/000420.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index eac675505c..28a49b13d6 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,3 +1,3 @@
 # Locally computed after checking signature
-sha256 d59d0c5c5225a126e5b98bf95d75e8dd368bdeeb3da2e9766dbe4fddaa9411b0  dovecot-2.3-pigeonhole-0.5.7.2.tar.gz
+sha256 36da68aae5157b83e21383f711b8977e5b6f5477f369f71e7e22e76a738bbd05  dovecot-2.3-pigeonhole-0.5.9.tar.gz
 sha256 fc9e9522216f2a9a28b31300e3c73c1df56acc27dfae951bf516e7995366b51a  COPYING
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 43519499c4..95bfa6fc4a 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.5.7.2
+DOVECOT_PIGEONHOLE_VERSION = 0.5.9
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.3-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = https://pigeonhole.dovecot.org/releases/2.3
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
