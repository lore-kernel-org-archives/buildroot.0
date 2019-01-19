From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Jan 2019 10:44:53 +0200
Subject: [Buildroot] [PATCH 1/1] python-logbook: bump to version 1.4.3
In-Reply-To: <20190119084454.22687-1-asafka7@gmail.com>
References: <20190119084454.22687-1-asafka7@gmail.com>
Message-ID: <20190119084454.22687-3-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-logbook/python-logbook.hash | 4 ++--
 package/python-logbook/python-logbook.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index a32ff3bde2..0db9def1ba 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/logbook/json
-md5	c9fab07b6a91aa7358155baa16802707  Logbook-1.4.1.tar.gz
-sha256	32375ce706d04a46886f9818bb953e53e0eda636552d7c0a2e482dd670fa56db  Logbook-1.4.1.tar.gz
+md5	352d66684713fc323febe60c9244270e  Logbook-1.4.3.tar.gz
+sha256	a5a96792abd8172c80d61b7530e134524f20e2841981038031e602ed5920fef5  Logbook-1.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256	2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index ab1b2703e2..4e9a5306d0 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.4.1
+PYTHON_LOGBOOK_VERSION = 1.4.3
 PYTHON_LOGBOOK_SOURCE = Logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/74/fc/3e7557ed1ef1bd4e3ee189fc670416abfc7192b550e8d3c1d858a63f41ab
+PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/f6/83/20fc0270614919cb799f76e32cf143a54c58ce2fa45c19fd38ac2e4f9977
 PYTHON_LOGBOOK_SETUP_TYPE = setuptools
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
-- 
2.19.1
