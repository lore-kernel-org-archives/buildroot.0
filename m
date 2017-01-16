From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 15:31:06 +0100
Subject: [Buildroot] [git commit] poppler: bump to version 0.51.0
Message-ID: <20170116143128.9D57F81E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f871c5545cc94fff3cd152136ad27d2f9f50a4df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 21decf6..af597e0 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	c9c93318b789d3933f6e0bad3bc65110280c28eac3f0666284bb9c9a0ab4bc36	poppler-0.50.0.tar.xz
+sha256	e997c9ad81a8372f2dd03a02b00692b8cc479c220340c8881edaca540f402c1f	poppler-0.51.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 478da40..c40d5ff 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.50.0
+POPPLER_VERSION = 0.51.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
