From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Dec 2016 15:10:03 +0000
Subject: [Buildroot] [PATCH 2/2] dovecot-pigeonhole: bump version to 0.4.16
In-Reply-To: <20161209151003.49165-1-Vincent.Riera@imgtec.com>
References: <20161209151003.49165-1-Vincent.Riera@imgtec.com>
Message-ID: <20161209151003.49165-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
  http://www.dovecot.org/list/dovecot-news/2016-October/000330.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 4 ++--
 package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
index f598825..95325a9 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256	c99ace6ead310c6c3b639922da618f90d846307da4fe252d994e5e51bf8a3de3	dovecot-2.2-pigeonhole-0.4.15.tar.gz
+# Locally computed after checking signature
+sha256 8f0b98f18062d6e241eef74ebe16cc167cd246361cbe6657d94f0ecc5d7d3234  dovecot-2.2-pigeonhole-0.4.16.tar.gz
diff --git a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
index 7c0a14c..846e7f9 100644
--- a/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
+++ b/package/dovecot-pigeonhole/dovecot-pigeonhole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOVECOT_PIGEONHOLE_VERSION = 0.4.15
+DOVECOT_PIGEONHOLE_VERSION = 0.4.16
 DOVECOT_PIGEONHOLE_SOURCE = dovecot-2.2-pigeonhole-$(DOVECOT_PIGEONHOLE_VERSION).tar.gz
 DOVECOT_PIGEONHOLE_SITE = http://pigeonhole.dovecot.org/releases/2.2
 DOVECOT_PIGEONHOLE_LICENSE = LGPLv2.1
-- 
2.10.1
