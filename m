From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 18 Oct 2019 21:26:22 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 19.7.0
In-Reply-To: <20191018182628.15545-1-asafka7@gmail.com>
References: <20191018182628.15545-1-asafka7@gmail.com>
Message-ID: <20191018182628.15545-25-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License update: copyright year bump and addition of a developer
to the contributors list.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-twisted/python-twisted.hash | 6 +++---
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index ac2c90b42d..0b7aa62021 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5 528b7856938edc2a752c244aebd94981 Twisted-19.2.1.tar.bz2
-sha256 fa2c04c2d68a9be7fc3975ba4947f653a57a656776f24be58ff0fe4b9aaf3e52 Twisted-19.2.1.tar.bz2
+md5 5e9296a952430d288cdcdc6ad9eb5ee8 Twisted-19.7.0.tar.bz2
+sha256 d5db93026568f60cacdc0615fcd21d46f694a6bfad0ef3ff53cde2b4bb85a39d Twisted-19.7.0.tar.bz2
 # Locally computed sha256
-sha256 61f0a3ad5048489bd985aa4b4e4a2e254a71461b3ad4a6e7a71a7f067a095010 LICENSE
+sha256 85b798413ba885b06cc1b91efe857a39f694071c29b04e80d23ea26ee271d613 LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 90fa35fdcc..da22ae77a3 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 19.2.1
+PYTHON_TWISTED_VERSION = 19.7.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.bz2
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/79/59/035de19362320e632301ed7bbde23e4c8cd6fc5e2f1cf8d354cdba857854
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/61/31/3855dcacd1d3b2e60c0b4ccc8e727b8cd497bd7087d327d81a9f0cbb580c
 PYTHON_TWISTED_SETUP_TYPE = setuptools
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.20.1
