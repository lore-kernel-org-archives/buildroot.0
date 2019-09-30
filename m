From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 30 Sep 2019 15:32:30 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-babel: bump to version 2.7.0
In-Reply-To: <20190930123302.28215-1-asafka7@gmail.com>
References: <20190930123302.28215-1-asafka7@gmail.com>
Message-ID: <20190930123302.28215-4-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE update: bump copyright year.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-babel/python-babel.hash | 6 +++---
 package/python-babel/python-babel.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-babel/python-babel.hash b/package/python-babel/python-babel.hash
index a52da012c7..95f9d725fb 100644
--- a/package/python-babel/python-babel.hash
+++ b/package/python-babel/python-babel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/babel/json
-md5	c384ac03026e8fe6f9b90f55201f1bff  Babel-2.6.0.tar.gz
-sha256	8cba50f48c529ca3fa18cf81fa9403be176d374ac4d60738b839122dfaaa3d23  Babel-2.6.0.tar.gz
+md5	83c158b7dae9135750a7cf204e6e2eea  Babel-2.7.0.tar.gz
+sha256	e86135ae101e31e2c8ec20a4e0c5220f4eed12487d5cf3f78be7e98d3a57fc28  Babel-2.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256	178b99c90df898d0bee84bd335f36b679c76fafa9d3c288b4eaea4ebd92d8602  LICENSE
+sha256	5a0df5d46e8cb14bd5d4c2cd77338b22f681fe88bd34236626b1a3ae3b50101a  LICENSE
diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index a507cceaeb..cf0a8ab14f 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BABEL_VERSION = 2.6.0
+PYTHON_BABEL_VERSION = 2.7.0
 PYTHON_BABEL_SOURCE = Babel-$(PYTHON_BABEL_VERSION).tar.gz
-PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/be/cc/9c981b249a455fa0c76338966325fc70b7265521bad641bf2932f77712f4
+PYTHON_BABEL_SITE = https://files.pythonhosted.org/packages/bd/78/9fb975cbb3f4b136de2cd4b5e5ce4a3341169ebf4c6c03630996d05428f1
 PYTHON_BABEL_SETUP_TYPE = setuptools
 PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
-- 
2.20.1
