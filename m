From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Sun,  9 Apr 2017 14:04:17 +0530
Subject: [Buildroot] [PATCH 06/10] python-alsaaudio: use SPDX short
	identifier for license string
In-Reply-To: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1491726861-8779-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1491726861-8779-6-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
---
 package/python-alsaaudio/python-alsaaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index 92c354e..73a7e74 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -8,7 +8,7 @@ PYTHON_ALSAAUDIO_VERSION = 0.8.2
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
 PYTHON_ALSAAUDIO_SITE = https://pypi.python.org/packages/source/p/pyalsaaudio
 PYTHON_ALSAAUDIO_SETUP_TYPE = distutils
-PYTHON_ALSAAUDIO_LICENSE = Python software foundation license v2
+PYTHON_ALSAAUDIO_LICENSE = Python-2.0
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
 PYTHON_ALSAAUDIO_DEPENDENCIES = alsa-lib
 
-- 
2.7.4
