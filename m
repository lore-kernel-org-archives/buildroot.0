From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 13:07:08 +0200
Subject: [Buildroot] [git commit] python-mad: add license information
Message-ID: <20140626115219.1BE3F9CF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9d48470a4fabbc33eb1f353aa11712e3b761c8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-mad/python-mad.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-mad/python-mad.mk b/package/python-mad/python-mad.mk
index 1b3cb75..a476fe1 100644
--- a/package/python-mad/python-mad.mk
+++ b/package/python-mad/python-mad.mk
@@ -5,9 +5,11 @@
 ################################################################################
 
 PYTHON_MAD_VERSION = 0.6
-PYTHON_MAD_SOURCE  = pymad-$(PYTHON_MAD_VERSION).tar.gz
-PYTHON_MAD_SITE    = http://spacepants.org/src/pymad/download/
+PYTHON_MAD_SOURCE = pymad-$(PYTHON_MAD_VERSION).tar.gz
+PYTHON_MAD_SITE = http://spacepants.org/src/pymad/download/
 PYTHON_MAD_SETUP_TYPE = distutils
+PYTHON_MAD_LICENSE = GPLv2+
+PYTHON_MAD_LICENSE_FILES = COPYING
 
 PYTHON_MAD_DEPENDENCIES = libmad
 
