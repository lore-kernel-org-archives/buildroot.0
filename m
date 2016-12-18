From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 18 Dec 2016 10:43:31 -0300
Subject: [Buildroot] [PATCH] poppler: bump to version 0.50.0
Message-ID: <20161218134331.6683-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/poppler/poppler.hash | 2 +-
 package/poppler/poppler.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poppler/poppler.hash b/package/poppler/poppler.hash
index 6c69589..21decf6 100644
--- a/package/poppler/poppler.hash
+++ b/package/poppler/poppler.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	14485f0e1e43dcddf49cfc02c2ccb92910ba3e0e91e06f4bd2642ec00cb3a79f	poppler-0.49.0.tar.xz
+sha256	c9c93318b789d3933f6e0bad3bc65110280c28eac3f0666284bb9c9a0ab4bc36	poppler-0.50.0.tar.xz
diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index d2f8c2e..478da40 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POPPLER_VERSION = 0.49.0
+POPPLER_VERSION = 0.50.0
 POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
 POPPLER_SITE = http://poppler.freedesktop.org
 POPPLER_DEPENDENCIES = fontconfig host-pkgconf
-- 
2.10.2
