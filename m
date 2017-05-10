From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 10 May 2017 09:00:57 -0400
Subject: [Buildroot] [PATCH 1/1] swig: bump to 3.0.12
Message-ID: <20170510130057.16408-1-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/swig/swig.hash | 2 +-
 package/swig/swig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 92ddc11..77c93a9 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	2939aae39dec06095462f1b95ce1c958ac80d07b926e48871046d17c0094f44c	swig-3.0.10.tar.gz
+sha256	7cf9f447ae7ed1c51722efc45e7f14418d15d7a1e143ac9f09a668999f4fc94d	swig-3.0.12.tar.gz
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 740b597..cdf9533 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SWIG_VERSION_MAJOR = 3.0
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).10
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 HOST_SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPTS = \
-- 
2.9.3
