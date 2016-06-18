From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Jun 2016 23:18:02 +0200
Subject: [Buildroot] [git commit] package/swig: bump version to 3.0.10
Message-ID: <20160618211846.A0B7381D36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9701b861cbfb435e03492ee2d661ff7f397d6cd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swig/swig.hash | 2 +-
 package/swig/swig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 62e3d20..92ddc11 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	06dc8816a225667ce1eee545af3caf87e1bbaa379c32838d4cea53152514348d	swig-3.0.7.tar.gz
+sha256	2939aae39dec06095462f1b95ce1c958ac80d07b926e48871046d17c0094f44c	swig-3.0.10.tar.gz
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index e4bd64c..5329d1b 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SWIG_VERSION_MAJOR = 3.0
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).7
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).10
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPTS = \
