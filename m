From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 13:59:13 +0100
Subject: [Buildroot] [git commit] package/python-alsaaudio: bump version to
	0.8.2
Message-ID: <20160201224704.E8EAB7F90D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ebb7f600381c1f88b7f5e093bd51a38cf5f68c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream moved to github, the old project site now redirects to the URL

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
