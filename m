From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 21:42:24 +0200
Subject: [Buildroot] [git commit] package/python-simpleaudio: bump to
 version 1.0.4
Message-ID: <20200417192946.9B82E8EEBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19d5d2af6b283cd4d7017375989a4558bf280547
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-simpleaudio/python-simpleaudio.hash | 6 +++---
 package/python-simpleaudio/python-simpleaudio.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-simpleaudio/python-simpleaudio.hash b/package/python-simpleaudio/python-simpleaudio.hash
index 353fa5e36c..0aac4c8678 100644
--- a/package/python-simpleaudio/python-simpleaudio.hash
+++ b/package/python-simpleaudio/python-simpleaudio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simpleaudio/json
-md5	92f0a0891a198c000fedce0599b46c7b  simpleaudio-1.0.2.tar.gz
-sha256	4e0e4c0359f153408e9b8a65342ec0c1d014f36fbe9cdb594e9b6e5348916af8  simpleaudio-1.0.2.tar.gz
+md5  8bd62157c286824e289e1f258419b98c  simpleaudio-1.0.4.tar.gz
+sha256  691c88649243544db717e7edf6a9831df112104e1aefb5f6038a5d071e8cf41d  simpleaudio-1.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256	b4340683e83f0f25ea40f992773ceec6c749c4d64ec2c09dfa49d7f5b029adbf  LICENSE.txt
+sha256  b4340683e83f0f25ea40f992773ceec6c749c4d64ec2c09dfa49d7f5b029adbf  LICENSE.txt
diff --git a/package/python-simpleaudio/python-simpleaudio.mk b/package/python-simpleaudio/python-simpleaudio.mk
index e23d4d026b..5cdb3a82c3 100644
--- a/package/python-simpleaudio/python-simpleaudio.mk
+++ b/package/python-simpleaudio/python-simpleaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEAUDIO_VERSION = 1.0.2
+PYTHON_SIMPLEAUDIO_VERSION = 1.0.4
 PYTHON_SIMPLEAUDIO_SOURCE = simpleaudio-$(PYTHON_SIMPLEAUDIO_VERSION).tar.gz
-PYTHON_SIMPLEAUDIO_SITE = https://files.pythonhosted.org/packages/ad/39/ce09ef827887cdfc755427195d7291446c1fb34a16356d1fec920d62269d
+PYTHON_SIMPLEAUDIO_SITE = https://files.pythonhosted.org/packages/94/1b/4dc29653733202b68c09d9c6ca085cf67ac54859ee860647ef21ac1ff3dc
 PYTHON_SIMPLEAUDIO_LICENSE = MIT
 PYTHON_SIMPLEAUDIO_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEAUDIO_SETUP_TYPE = setuptools
