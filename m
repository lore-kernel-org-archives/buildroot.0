From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:02:51 +0200
Subject: [Buildroot] [git commit] poppler: bump to version 0.24.2
Message-ID: <20131009202219.D7E6E9B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85dab66dbeb9eaa535f6d5ecbc70889582a43185
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 81bdbbb..56a4d3f 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.22.3
+POPPLER_VERSION = 0.24.2
+POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig
 POPPLER_LICENSE = GPLv2+
