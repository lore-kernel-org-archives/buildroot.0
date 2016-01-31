From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 31 Jan 2016 13:24:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-alsaaudio: bump version to
	0.8.2
Message-ID: <1454243062-27686-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream moved to github, the old project site now redirects to the URL

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-alsaaudio/Config.in             | 2 +-
 package/python-alsaaudio/python-alsaaudio.hash | 4 +++-
 package/python-alsaaudio/python-alsaaudio.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-alsaaudio/Config.in b/package/python-alsaaudio/Config.in
index 22a7e87..60523bf 100644
--- a/package/python-alsaaudio/Config.in
+++ b/package/python-alsaaudio/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_PYTHON_ALSAAUDIO
 	  The PyAlsaAudio package contains bindings for the ALSA sound
 	  API.
 
-	  http://pyalsaaudio.sourceforge.net/
+	  http://larsimmisch.github.io/pyalsaaudio/
diff --git a/package/python-alsaaudio/python-alsaaudio.hash b/package/python-alsaaudio/python-alsaaudio.hash
index d805710..92277ec 100644
--- a/package/python-alsaaudio/python-alsaaudio.hash
+++ b/package/python-alsaaudio/python-alsaaudio.hash
@@ -1,2 +1,4 @@
+# From https://pypi.python.org/pypi?:action=show_md5&digest=1f22415a3d8da4b303182ad81c2d062e
+md5	1f22415a3d8da4b303182ad81c2d062e	pyalsaaudio-0.8.2.tar.gz
 # Locally calculated
-sha256	bbd5a9eb351def673800707f48e64680685f397e29da72ea4c9355e1a2b2a0fd  pyalsaaudio-0.7.tar.gz
+sha256	b6df486f1c4035041a5f3800496b86c64e48e4a7d47f94dcbca11b0187aa3a15	pyalsaaudio-0.8.2.tar.gz
diff --git a/package/python-alsaaudio/python-alsaaudio.mk b/package/python-alsaaudio/python-alsaaudio.mk
index e64ddb4..92c354e 100644
--- a/package/python-alsaaudio/python-alsaaudio.mk
+++ b/package/python-alsaaudio/python-alsaaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ALSAAUDIO_VERSION = 0.7
+PYTHON_ALSAAUDIO_VERSION = 0.8.2
 PYTHON_ALSAAUDIO_SOURCE = pyalsaaudio-$(PYTHON_ALSAAUDIO_VERSION).tar.gz
-PYTHON_ALSAAUDIO_SITE = http://downloads.sourceforge.net/project/pyalsaaudio
+PYTHON_ALSAAUDIO_SITE = https://pypi.python.org/packages/source/p/pyalsaaudio
 PYTHON_ALSAAUDIO_SETUP_TYPE = distutils
 PYTHON_ALSAAUDIO_LICENSE = Python software foundation license v2
 PYTHON_ALSAAUDIO_LICENSE_FILES = LICENSE
-- 
2.7.0
