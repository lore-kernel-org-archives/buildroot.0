From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue,  4 Apr 2017 19:50:12 -0300
Subject: [Buildroot] [PATCH 04/11] package: normalize separator size to 80
In-Reply-To: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
References: <20170404225019.27916-1-ricardo.martincoski@gmail.com>
Message-ID: <20170404225019.27916-4-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Occurrences were searched using [1]:
check-package --include-only PackageHeader $(find * -type f)
and manually fixed to comply to [2].

[1] http://patchwork.ozlabs.org/patch/729669/
[2] http://nightly.buildroot.org/#writing-rules-mk

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
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
index 4ea9adf6a..7d494c8f1 100644
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
index d87bdca96..0c2b0f919 100644
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
index a42b34b0e..1ce259bd1 100644
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
index b9562ee6b..24ec067da 100644
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
index f4671ae3c..6df770793 100644
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
index e6d564a88..e49c2ac14 100644
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
index 36b9afd10..22467948a 100644
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
-- 
2.11.0
