From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2015 20:40:30 +0100
Subject: [Buildroot] [PATCH/next 3/8] package/swig: bump version to 3.0.7
In-Reply-To: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
References: <1448134835-27519-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1448134835-27519-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/swig/swig.hash | 2 +-
 package/swig/swig.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/swig/swig.hash b/package/swig/swig.hash
index 98baaa2..62e3d20 100644
--- a/package/swig/swig.hash
+++ b/package/swig/swig.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c602821a541817a4317f7  swig-2.0.12.tar.gz
+sha256	06dc8816a225667ce1eee545af3caf87e1bbaa379c32838d4cea53152514348d	swig-3.0.7.tar.gz
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 6b9b8ae..a2125aa 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION_MAJOR = 2.0
-SWIG_VERSION = $(SWIG_VERSION_MAJOR).12
+SWIG_VERSION_MAJOR = 3.0
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).7
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPTS = \
-- 
2.6.2
