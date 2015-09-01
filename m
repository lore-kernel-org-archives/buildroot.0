From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Tue,  1 Sep 2015 10:10:29 +0200
Subject: [Buildroot] [PATCH 3/6] python-rtslib-fb: bump version
In-Reply-To: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1441095032-5656-3-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add new dependency to python-six.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/python-rtslib-fb/python-rtslib-fb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-rtslib-fb/python-rtslib-fb.mk b/package/python-rtslib-fb/python-rtslib-fb.mk
index d45c261..85bee0b 100644
--- a/package/python-rtslib-fb/python-rtslib-fb.mk
+++ b/package/python-rtslib-fb/python-rtslib-fb.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_RTSLIB_FB_VERSION = v2.1.fb50
+PYTHON_RTSLIB_FB_VERSION = v2.1.fb57
 PYTHON_RTSLIB_FB_SITE = $(call github,agrover,rtslib-fb,$(PYTHON_RTSLIB_FB_VERSION))
 PYTHON_RTSLIB_FB_LICENSE = Apache-2.0
 PYTHON_RTSLIB_FB_LICENSE_FILES = COPYING
 PYTHON_RTSLIB_FB_SETUP_TYPE = setuptools
+PYTHON_RTSLIB_FB_DEPENDENCIES = python-six
 
 $(eval $(python-package))
-- 
2.5.0
