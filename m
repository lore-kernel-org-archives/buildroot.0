From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue, 27 Aug 2019 20:28:06 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-iptables: bump to version
 0.14.0
In-Reply-To: <20190827172812.10594-1-asafka7@gmail.com>
References: <20190827172812.10594-1-asafka7@gmail.com>
Message-ID: <20190827172812.10594-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-iptables/python-iptables.hash | 4 ++--
 package/python-iptables/python-iptables.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
index 3c83a15b8c..46786699ac 100644
--- a/package/python-iptables/python-iptables.hash
+++ b/package/python-iptables/python-iptables.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-iptables/json
-md5	3761a77c28ca0adc69f4e0e11af2f321  python-iptables-0.13.0.tar.gz
-sha256	53b09257467681d7ea547cd3140eccd8c70effb3748af4b56ffed2f6011189e7  python-iptables-0.13.0.tar.gz
+md5	98ee55f239bf8f2d002915d76b416c22  python-iptables-0.14.0.tar.gz
+sha256	61b23850ad5d917436aa73c2847ab941bc0edbe79a324b0eebdb98af0b65b10d  python-iptables-0.14.0.tar.gz
 # Locally calculated
 sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index 4aed474e39..66e478a89a 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_IPTABLES_VERSION = 0.13.0
-PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/6e/3a/866f5b1bccc6a4d94811f84304d700da14518ff55b80e08ff2241b3221bf
+PYTHON_IPTABLES_VERSION = 0.14.0
+PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/08/5e/16a5ca35c420b8059eeb72716e316eeb6f0e59ce028998d36b2dc87554e5
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
-- 
2.20.1
