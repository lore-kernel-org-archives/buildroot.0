From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  9 Apr 2017 14:04:20 +0530
Subject: [Buildroot] [PATCH 09/10] python-backports-abc: add version to
	license string
In-Reply-To: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491726861-8779-9-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file refers to Python license version 2. Use SPDX short
identifier for license string and add license file while at it.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python-backports-abc/python-backports-abc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-backports-abc/python-backports-abc.mk b/package/python-backports-abc/python-backports-abc.mk
index f84318b..66cea17 100644
--- a/package/python-backports-abc/python-backports-abc.mk
+++ b/package/python-backports-abc/python-backports-abc.mk
@@ -7,7 +7,8 @@
 PYTHON_BACKPORTS_ABC_VERSION = 0.5
 PYTHON_BACKPORTS_ABC_SOURCE = backports_abc-$(PYTHON_BACKPORTS_ABC_VERSION).tar.gz
 PYTHON_BACKPORTS_ABC_SITE = https://pypi.python.org/packages/68/3c/1317a9113c377d1e33711ca8de1e80afbaf4a3c950dd0edfaf61f9bfe6d8
-PYTHON_BACKPORTS_ABC_LICENSE = Python Software Foundation License
+PYTHON_BACKPORTS_ABC_LICENSE = Python-2.0
+PYTHON_BACKPORTS_ABC_LICENSE_FILES = LICENSE
 PYTHON_BACKPORTS_ABC_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.7.4
