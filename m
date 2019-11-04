From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Nov 2019 21:43:35 +0100
Subject: [Buildroot] [git commit] package/python-psutil: bump to version
 5.6.4
Message-ID: <20191104203653.9527F8A5E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=956f32b1eb34d38b10b848985e6b8b2cd293f1ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-psutil/python-psutil.hash | 4 ++--
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index e61bffa840..3081e41540 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	1bbc1788588cc3c2c461cd98a830ba72  psutil-5.6.3.tar.gz
-sha256	863a85c1c0a5103a12c05a35e59d336e1d665747e531256e061213e2e90f63f3  psutil-5.6.3.tar.gz
+md5	7ca9d297c23ca0074c1cf173bed061b0  psutil-5.6.4.tar.gz
+sha256	512e854d68f8b42f79b2c7864d997b39125baff9bcff00028ce43543867de7c4  psutil-5.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256	24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index bb4d58930f..0edf1c669b 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.6.3
+PYTHON_PSUTIL_VERSION = 5.6.4
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/1c/ca/5b8c1fe032a458c2c4bcbe509d1401dca9dda35c7fc46b36bb81c2834740
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/47/ea/d3b6d6fd0b4a6c12984df652525f394e68c8678d2b05075219144eb3a1cf
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
