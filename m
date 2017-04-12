From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:04:47 +0200
Subject: [Buildroot] [git commit] dovecot-pigeonhole: bump version to 0.4.18
Message-ID: <20170412190505.D138B82211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1ae6188a4f855f45575ffeb84e92d76828bf8a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index 7898ff8..84b260b 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
 # Locally computed after checking signature
-sha256 74d869c7532cbf4fe41e3cc95a1aa6ce32e98f4d423f0d099da1e0fba022dae3  dovecot-2.2-pigeonhole-0.4.17.tar.gz
+sha256 dd871bb57fad22795460f613f3c9484a8bf229272ac00956d837a34444f1c3a9  dovecot-2.2-pigeonhole-0.4.18.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 50e148b..af330d0 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.17
+DOVECOT_PIGEONHOLE_VERSION = 0.4.18
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPL-2.1
