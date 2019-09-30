From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:31 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-backports-ssl-match: bump to
 version 3.7.0.1
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE.txt file was moved to the root directory (same sha256).

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 .../python-backports-ssl-match-hostname.hash             | 9 +++++----
 .../python-backports-ssl-match-hostname.mk               | 6 +++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
index b43e1af5a6..145174cd5b 100644
--- a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
+++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/backports.ssl_match_hostname/json, sha256 locally computed
-md5	c03fc5e2c7b3da46b81acf5cbacfe1e6  backports.ssl_match_hostname-3.5.0.1.tar.gz
-sha256	502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2  backports.ssl_match_hostname-3.5.0.1.tar.gz
-sha256	bfc8a75a4b9aec224aa7973c0c9d7cc0134bdcbf8eefd008936b58554d66e97e  backports/ssl_match_hostname/LICENSE.txt
+# md5, sha256 from https://pypi.org/pypi/backports.ssl_match_hostname/json
+md5	32d2f593af01a046bec3d2f5181a420a  backports.ssl_match_hostname-3.7.0.1.tar.gz
+sha256	bb82e60f9fbf4c080eabd957c39f0641f0fc247d9a16e31e26d594d8f42b9fd2  backports.ssl_match_hostname-3.7.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256	bfc8a75a4b9aec224aa7973c0c9d7cc0134bdcbf8eefd008936b58554d66e97e  LICENSE.txt
diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
index 01c8bc448c..300961662d 100644
--- a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
+++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION = 3.5.0.1
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION = 3.7.0.1
 PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SOURCE = backports.ssl_match_hostname-$(PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION).tar.gz
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE = https://pypi.python.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE = https://files.pythonhosted.org/packages/ff/2b/8265224812912bc5b7a607c44bf7b027554e1b9775e9ee0de8032e3de4b2
 PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SETUP_TYPE = distutils
 PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE = Python-2.0
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE_FILES = backports/ssl_match_hostname/LICENSE.txt
+PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.20.1
