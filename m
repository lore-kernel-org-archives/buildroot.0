From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  4 Sep 2017 08:21:24 +0200
Subject: [Buildroot] [PATCH 3/5] python-typepy: bump to version 0.0.20
In-Reply-To: <20170904062126.3274-1-yegorslists@googlemail.com>
References: <20170904062126.3274-1-yegorslists@googlemail.com>
Message-ID: <20170904062126.3274-3-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-typepy/python-typepy.hash | 4 ++--
 package/python-typepy/python-typepy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typepy/python-typepy.hash b/package/python-typepy/python-typepy.hash
index 7700390f7..9ecac881e 100644
--- a/package/python-typepy/python-typepy.hash
+++ b/package/python-typepy/python-typepy.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/typepy/json, sha256 locally computed
-md5	a8ab7edcf8f52bb091121e90d21dc113  typepy-0.0.14.tar.gz
-sha256	ef07125b464a6808b7ac052d7ee35873a4424a95dbc9d7db71a380d0135d9981  typepy-0.0.14.tar.gz
+md5	b9abd4d661dabe512e95ca69ddb65d55  typepy-0.0.20.tar.gz
+sha256	a1a5b9438670d4a5d9f882b7499ea85d06dc384577bb7636cb29d903288bca8c  typepy-0.0.20.tar.gz
diff --git a/package/python-typepy/python-typepy.mk b/package/python-typepy/python-typepy.mk
index 10270bbfa..33d809199 100644
--- a/package/python-typepy/python-typepy.mk
+++ b/package/python-typepy/python-typepy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEPY_VERSION = 0.0.14
+PYTHON_TYPEPY_VERSION = 0.0.20
 PYTHON_TYPEPY_SOURCE = typepy-$(PYTHON_TYPEPY_VERSION).tar.gz
-PYTHON_TYPEPY_SITE = https://pypi.python.org/packages/5c/1a/3836e06f2f476e785006bb0f9305160577586a8d4ae2a017fc778f580344
+PYTHON_TYPEPY_SITE = https://pypi.python.org/packages/88/98/c79a19ae571d713fa0b10bc7e0fe611e53c542720b5a9dd2691ca15b3dd8
 PYTHON_TYPEPY_SETUP_TYPE = setuptools
 PYTHON_TYPEPY_LICENSE = MIT
 PYTHON_TYPEPY_LICENSE_FILES = LICENSE
-- 
2.11.0
