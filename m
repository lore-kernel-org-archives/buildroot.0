From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 23 May 2016 13:59:08 +0100
Subject: [Buildroot] [PATCH next] make: bump version to 4.2
Message-ID: <1464008348-16451-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/make/make.hash | 2 +-
 package/make/make.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/make/make.hash b/package/make/make.hash
index db95c60..99aea2f 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256	0bc7613389650ee6a24554b52572a272f7356164fd2c4132b0bcf13123e4fca5	make-4.1.tar.bz2
+sha256 4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f  make-4.2.tar.bz2
diff --git a/package/make/make.mk b/package/make/make.mk
index 20702dc..43f4f77 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MAKE_VERSION = 4.1
+MAKE_VERSION = 4.2
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
 MAKE_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-- 
2.7.3
