From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 22:27:21 +0200
Subject: [Buildroot] [git commit] poppler: bump version to 0.54.0
Message-ID: <20170424203123.DCFAB827D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc41dbe658267a70dc2661f51c6d1c9058817b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 83856a3..4ef5799 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 592bf72960c6b5948b67657594b05e72d9a278daf7613c9f3cdff9a5b73096a8  poppler-0.53.0.tar.xz
+sha256 10cca9a67cc2e6f4f9024192b1067c444218bf94430891f43dc819d78536ca31  poppler-0.54.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index aea90b0..056193c 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.53.0
+POPPLER_VERSION = 0.54.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
