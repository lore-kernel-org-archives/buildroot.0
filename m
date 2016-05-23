From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 16:27:05 +0200
Subject: [Buildroot] [git commit branch/next] package/make: bump version to
	4.2
Message-ID: <20160523142736.F32EE81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2da155d27649ae876b739637b728e7808f2ccb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Announcement URL:

  http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00013.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/make/make.hash | 4 +++-
 package/make/make.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/make/make.hash b/package/make/make.hash
index db95c60..528822f 100644
--- a/package/make/make.hash
+++ b/package/make/make.hash
@@ -1,2 +1,4 @@
+# From http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00013.html
+sha1 85ad14d08766201ffe71efa866f4fb91  make-4.2.tar.bz2
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
