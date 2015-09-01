From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Tue,  1 Sep 2015 10:10:30 +0200
Subject: [Buildroot] [PATCH 4/6] python-configshell-fb: bump version
In-Reply-To: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1441095032-5656-4-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add new dependency to python-six.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/python-configshell-fb/python-configshell-fb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-configshell-fb/python-configshell-fb.mk b/package/python-configshell-fb/python-configshell-fb.mk
index 76ef48d..d0671d5 100644
--- a/package/python-configshell-fb/python-configshell-fb.mk
+++ b/package/python-configshell-fb/python-configshell-fb.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb15
+PYTHON_CONFIGSHELL_FB_VERSION = v1.1.fb18
 PYTHON_CONFIGSHELL_FB_SITE = $(call github,agrover,configshell-fb,$(PYTHON_CONFIGSHELL_FB_VERSION))
 PYTHON_CONFIGSHELL_FB_LICENSE = Apache-2.0
 PYTHON_CONFIGSHELL_FB_LICENSE_FILES = COPYING
 PYTHON_CONFIGSHELL_FB_SETUP_TYPE = setuptools
-PYTHON_CONFIGSHELL_FB_DEPENDENCIES = python-pyparsing python-urwid
+PYTHON_CONFIGSHELL_FB_DEPENDENCIES = python-pyparsing python-six python-urwid
 
 $(eval $(python-package))
-- 
2.5.0
