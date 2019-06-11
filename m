From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 11 Jun 2019 20:24:16 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: bump to version 5.6.3
In-Reply-To: <20190611172416.6099-1-asafka7@gmail.com>
References: <20190611172416.6099-1-asafka7@gmail.com>
Message-ID: <20190611172416.6099-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License update: change phrasing for Github to recognize
it's BSD-3-Clause.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-psutil/python-psutil.hash | 6 +++---
 package/python-psutil/python-psutil.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index a7d49a9ab6..e61bffa840 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psutil/json
-md5	571962acd249bcfbae317884af47c402  psutil-5.6.2.tar.gz
-sha256	828e1c3ca6756c54ac00f1427fdac8b12e21b8a068c3bb9b631a1734cada25ed  psutil-5.6.2.tar.gz
+md5	1bbc1788588cc3c2c461cd98a830ba72  psutil-5.6.3.tar.gz
+sha256	863a85c1c0a5103a12c05a35e59d336e1d665747e531256e061213e2e90f63f3  psutil-5.6.3.tar.gz
 # Locally computed sha256 checksums
-sha256	bb073826b0dfb43b631c38ad5d9844cda74cc631d2a5569ad8798be4274a3e17  LICENSE
+sha256	24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index ed1a9051c8..bb4d58930f 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 5.6.2
+PYTHON_PSUTIL_VERSION = 5.6.3
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
-PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/c6/c1/beed5e4eaa1345901b595048fab1c85aee647ea0fc02d9e8bf9aceb81078
+PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/1c/ca/5b8c1fe032a458c2c4bcbe509d1401dca9dda35c7fc46b36bb81c2834740
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
 PYTHON_PSUTIL_LICENSE = BSD-3-Clause
 PYTHON_PSUTIL_LICENSE_FILES = LICENSE
-- 
2.20.1
