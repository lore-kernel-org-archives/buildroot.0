From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:40:53 +0200
Subject: [Buildroot] [git commit] package: normalize separator size to 80
Message-ID: <20170406204058.D7FB98274D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c21ee46a79a6ea36744aa2d453db8280a35db67
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Occurrences were searched using [1]:
check-package --include-only PackageHeader $(find * -type f)
and manually fixed to comply to [2].

[1] http://patchwork.ozlabs.org/patch/729669/
[2] http://nightly.buildroot.org/#writing-rules-mk

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cxxtest/cxxtest.mk                       | 4 ++--
 package/fwup/fwup.mk                             | 4 ++--
 package/python-docutils/python-docutils.mk       | 4 ++--
 package/python-simpleaudio/python-simpleaudio.mk | 4 ++--
 package/rabbitmq-server/rabbitmq-server.mk       | 4 ++--
 package/trousers/trousers.mk                     | 4 ++--
 package/udpxy/udpxy.mk                           | 2 +-
 7 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/cxxtest/cxxtest.mk b/package/cxxtest/cxxtest.mk
index 4ea9adf..7d494c8 100644
--- a/package/cxxtest/cxxtest.mk
+++ b/package/cxxtest/cxxtest.mk
@@ -1,8 +1,8 @@
-#######################################################################################
+################################################################################
 #
 # cxxtest
 #
-#######################################################################################
+################################################################################
 
 CXXTEST_VERSION = 4.4
 CXXTEST_SITE = https://github.com/CxxTest/cxxtest/releases/download/$(CXXTEST_VERSION)
diff --git a/package/fwup/fwup.mk b/package/fwup/fwup.mk
index d87bdca..0c2b0f9 100644
--- a/package/fwup/fwup.mk
+++ b/package/fwup/fwup.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # fwup
 #
-#############################################################
+################################################################################
 
 FWUP_VERSION = v0.8.2
 FWUP_SITE = $(call github,fhunleth,fwup,$(FWUP_VERSION))
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index a42b34b..1ce259b 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-docutils
 #
-#############################################################
+################################################################################
 
 PYTHON_DOCUTILS_VERSION = 0.13.1
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
diff --git a/package/python-simpleaudio/python-simpleaudio.mk b/package/python-simpleaudio/python-simpleaudio.mk
index b9562ee..24ec067 100644
--- a/package/python-simpleaudio/python-simpleaudio.mk
+++ b/package/python-simpleaudio/python-simpleaudio.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # python-simpleaudio
 #
-#############################################################
+################################################################################
 
 PYTHON_SIMPLEAUDIO_VERSION = 1.0.1
 PYTHON_SIMPLEAUDIO_SOURCE = simpleaudio-$(PYTHON_SIMPLEAUDIO_VERSION).tar.gz
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
index f4671ae..6df7707 100644
--- a/package/rabbitmq-server/rabbitmq-server.mk
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # rabbitmq-server
 #
-#############################################################
+################################################################################
 
 RABBITMQ_SERVER_VERSION = 3.6.6
 RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index e6d564a..e49c2ac 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -1,8 +1,8 @@
-#############################################################
+################################################################################
 #
 # trousers
 #
-##############################################################
+################################################################################
 
 TROUSERS_VERSION = 0.3.13
 TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
diff --git a/package/udpxy/udpxy.mk b/package/udpxy/udpxy.mk
index 36b9afd..2246794 100644
--- a/package/udpxy/udpxy.mk
+++ b/package/udpxy/udpxy.mk
@@ -2,7 +2,7 @@
 #
 # udpxy
 #
-#################################################################################
+################################################################################
 
 UDPXY_VERSION = 1.0.23-9-prod
 UDPXY_SOURCE = udpxy.$(UDPXY_VERSION).tar.gz
