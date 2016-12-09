From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:13:52 +0100
Subject: [Buildroot] [git commit] dovecot: bump version to 2.2.27 (security)
Message-ID: <20161209171846.81ED680102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e244d79cd826b22fe628e4026d12baa8a1842c4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2016-8652 : http://www.securityfocus.com/bid/94639/

Release notes:
  http://www.dovecot.org/list/dovecot-news/2016-December/000333.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/dovecot.hash | 4 ++--
 package/dovecot/dovecot.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dovecot/dovecot.hash b/package/dovecot/dovecot.hash
index 0f67f0e..e7b9c33 100644
--- a/package/dovecot/dovecot.hash
+++ b/package/dovecot/dovecot.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256	d8d9f32c846397f7c22749a84c5cf6f59c55ff7ded3dc9f07749a255182f9667	dovecot-2.2.25.tar.gz
+# Locally computed after checking signature
+sha256 897f92a87cda4b27b243f8149ce0ba7b7e71a2be8fb7994eb0a025e54cde18e9  dovecot-2.2.27.tar.gz
diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 31c62d3..3dd231a 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOVECOT_VERSION_MAJOR = 2.2
-DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).25
+DOVECOT_VERSION = $(DOVECOT_VERSION_MAJOR).27
 DOVECOT_SITE = http://www.dovecot.org/releases/$(DOVECOT_VERSION_MAJOR)
 DOVECOT_INSTALL_STAGING = YES
 DOVECOT_LICENSE = LGPLv2.1
