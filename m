From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Jan 2020 17:15:10 +0100
Subject: [Buildroot] [git commit] package/python-psutil: bump to version
 5.6.7
Message-ID: <20200109160609.B3C4487FF4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50ac16660525fe9773d9665c0f13cce3e9a1988e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 3081e41540..7f3d629d66 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	7ca9d297c23ca0074c1cf173bed061b0  psutil-5.6.4.tar.gz
-sha256	512e854d68f8b42f79b2c7864d997b39125baff9bcff00028ce43543867de7c4  psutil-5.6.4.tar.gz
+md5	b2c94e0368fc6e6f237a7252f8e85ca2  psutil-5.6.7.tar.gz
+sha256	ffad8eb2ac614518bbe3c0b8eb9dffdb3a8d2e3a7d5da51c5b974fb723a5c5aa  psutil-5.6.7.tar.gz
 # Locally computed sha256 checksums
 sha256	24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 0edf1c669b..62a94f3c41 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.6.4
+PYTHON_PSUTIL_VERSION = 5.6.7
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/47/ea/d3b6d6fd0b4a6c12984df652525f394e68c8678d2b05075219144eb3a1cf
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/73/93/4f8213fbe66fc20cb904f35e6e04e20b47b85bee39845cc66a0bcf5ccdcb
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
