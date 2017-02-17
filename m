From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Feb 2017 16:49:50 +0100
Subject: [Buildroot] [git commit branch/next] poppler: bump to version 0.52.0
Message-ID: <20170217155021.C609A821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=897f7f124245f95fca334acfa77ffd7aaadb5f88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index af597e0..1c57ef3 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e997c9ad81a8372f2dd03a02b00692b8cc479c220340c8881edaca540f402c1f	poppler-0.51.0.tar.xz
+sha256	528b661738839f9a25f6e580fcd2d5db007e0a1948580c6489f0062798ca1992	poppler-0.52.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index fda8284..5c2d096 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.51.0
+POPPLER_VERSION = 0.52.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
