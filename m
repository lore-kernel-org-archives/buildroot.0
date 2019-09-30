From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:42 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-jedi: bump to version 0.15.1
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-16-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 83ff196f40..1fc3a3da50 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5	46c12589de9df839ff6be79c5009766d  jedi-0.13.3.tar.gz
-sha256	2bb0603e3506f708e792c7f4ad8fc2a7a9d9c2d292a358fbbd58da531695595b  jedi-0.13.3.tar.gz
+md5	ba88266caac41988ffb4fd6041a3c354  jedi-0.15.1.tar.gz
+sha256	ba859c74fa3c966a22f2aeebe1b74ee27e2a462f56d3f5f7ca4a59af61bfe42e  jedi-0.15.1.tar.gz
 # Locally computed sha256 checksums
 sha256	78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256	9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 84c9427d96..e11146def7 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.13.3
+PYTHON_JEDI_VERSION = 0.15.1
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/96/fb/e99fc0442f8a0fa4bf5d34162c2d98131489017f661bf8a331857844b145
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/85/03/cd5a6e44a5753b4d539288d9d1f9645caac889c17dd2950292a8818f86b2
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme)
 PYTHON_JEDI_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE
-- 
2.20.1
