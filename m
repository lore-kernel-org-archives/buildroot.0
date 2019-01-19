From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 19 Jan 2019 10:44:54 +0200
Subject: [Buildroot] [PATCH 1/1] python-txtorcon: bump to version 19.0.0
In-Reply-To: <20190119084454.22687-1-asafka7@gmail.com>
References: <20190119084454.22687-1-asafka7@gmail.com>
Message-ID: <20190119084454.22687-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-txtorcon/python-txtorcon.hash | 4 ++--
 package/python-txtorcon/python-txtorcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txtorcon/python-txtorcon.hash b/package/python-txtorcon/python-txtorcon.hash
index d46a7769dc..ffc4e8379c 100644
--- a/package/python-txtorcon/python-txtorcon.hash
+++ b/package/python-txtorcon/python-txtorcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txtorcon/json
-md5    31492e847973710f6533e9979a134ffa  txtorcon-18.3.0.tar.gz
-sha256 5601956b3a2452526cd1ea31662696a51ddbf8ed6452633ee464fc1ff275f8b0  txtorcon-18.3.0.tar.gz
+md5	7e6ef4d29c2cc51e85614cd2d57bf8df  txtorcon-19.0.0.tar.gz
+sha256	3731b740653e3f551412744f1fcd7fa6f04aa9fa37c90dc6c9152e619886bf3b  txtorcon-19.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256 3ada1c32ef38c23d96d7f4e8f4a226c527f51e0202883c7543b06f9cc5228a2b  LICENSE
diff --git a/package/python-txtorcon/python-txtorcon.mk b/package/python-txtorcon/python-txtorcon.mk
index 6ebcdb4f90..7bf1c252b9 100644
--- a/package/python-txtorcon/python-txtorcon.mk
+++ b/package/python-txtorcon/python-txtorcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXTORCON_VERSION = 18.3.0
+PYTHON_TXTORCON_VERSION = 19.0.0
 PYTHON_TXTORCON_SOURCE = txtorcon-$(PYTHON_TXTORCON_VERSION).tar.gz
-PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/a2/71/2fe0c7d9350ff95cd22128f375dbf2b49438ca1a5d8ca0795311a964586b
+PYTHON_TXTORCON_SITE = https://files.pythonhosted.org/packages/b7/93/e16d8160bac3a19d13c9ead9ac6b38f837f2534d40884109a334be1f849c
 PYTHON_TXTORCON_SETUP_TYPE = setuptools
 PYTHON_TXTORCON_LICENSE = MIT
 PYTHON_TXTORCON_LICENSE_FILES = LICENSE
-- 
2.19.1
