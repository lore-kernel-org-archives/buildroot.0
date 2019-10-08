From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  8 Oct 2019 10:28:00 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version 2019.3
In-Reply-To: <20191008072801.3745-1-asafka7@gmail.com>
References: <20191008072801.3745-1-asafka7@gmail.com>
Message-ID: <20191008072801.3745-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index 9e0dfe0289..d1ce81e590 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5	8c21963449c3a793aa61ef122e171516  pytz-2019.2.tar.gz
-sha256	26c0b32e437e54a18161324a2fca3c4b9846b74a8dccddd843113109e1116b32  pytz-2019.2.tar.gz
+md5	c3d84a465fc56a4edd52cca8873ac0df  pytz-2019.3.tar.gz
+sha256	b02c06db6cf09c12dd25137e563b31700d3b80fcc4ad23abb7a315f2789819be  pytz-2019.3.tar.gz
 # Locally computed sha256 checksums
 sha256	39f07c72a1bfda349cbd27bac9bcb1e6f8c5b4e5cc3fadf56900406e8cc0b792  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 217d4850f2..888f3c4556 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2019.2
+PYTHON_PYTZ_VERSION = 2019.3
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/27/c0/fbd352ca76050952a03db776d241959d5a2ee1abddfeb9e2a53fdb489be4
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/82/c3/534ddba230bd4fbbd3b7a3d35f3341d014cca213f369a9940925e7e5f691
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
