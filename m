From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:37 -0300
Subject: [Buildroot] [PATCH 31/54] python-mad: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-31-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-mad/python-mad.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
 
-- 
1.8.5.5
