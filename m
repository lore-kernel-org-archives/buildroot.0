From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:44:14 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libnspr: bump to
 version 4.23
Message-ID: <20191030101953.385AB8DF26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdcc34b08e0c1f9fc90ad067aa3a96dea3d2868a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a8be14639c464eb57be0ea65ae4607ea12190207)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/libnspr.hash | 2 +-
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 321b67956a..0317f20b19 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/nspr/releases/v4.20/src/SHA256SUMS
-sha256	c9e4b6cc24856ec93202fe13704b38b38ba219f0f2aeac93090ce2b6c696d430  nspr-4.22.tar.gz
+sha256	4b9d821037faf5723da901515ed9cac8b23ef1ea3729022259777393453477a4  nspr-4.23.tar.gz
 # Locally calculated
 sha256	fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 29005d526a..f21f69a746 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.22
+LIBNSPR_VERSION = 4.23
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
