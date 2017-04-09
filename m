From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:48:07 +0200
Subject: [Buildroot] [git commit] python-alsaaudio: use SPDX short
	identifier for license string
Message-ID: <20170409115341.5AB0B826EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b9a66c5abf93a2a6198ccbdafa25b0091bffb81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
