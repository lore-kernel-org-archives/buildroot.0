From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  1 Nov 2019 19:04:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: bump to version
 1.18.2
In-Reply-To: <20191101170417.29286-1-asafka7@gmail.com>
References: <20191101170417.29286-1-asafka7@gmail.com>
Message-ID: <20191101170417.29286-9-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pycairo/python-pycairo.hash | 4 ++--
 package/python-pycairo/python-pycairo.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycairo/python-pycairo.hash b/package/python-pycairo/python-pycairo.hash
index 32e1f091ba..f0b76b1e38 100644
--- a/package/python-pycairo/python-pycairo.hash
+++ b/package/python-pycairo/python-pycairo.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycairo/json
-md5	7610da8a40a7bed548991aa3416431d1  pycairo-1.18.1.tar.gz
-sha256	70172e58b6bad7572a3518c26729b074acdde15e6fee6cbab6d3528ad552b786  pycairo-1.18.1.tar.gz
+md5	be2ba51f234270dec340f28f1695a95e  pycairo-1.18.2.tar.gz
+sha256	dcb853fd020729516e8828ad364084e752327d4cff8505d20b13504b32b16531  pycairo-1.18.2.tar.gz
 # Locally computed sha256 checksums
 sha256	22c7747e2decb1b26e395b45dbaeb627784ef7fdbf2b80ac09a26a560277e58a  COPYING
 sha256	d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING-LGPL-2.1
diff --git a/package/python-pycairo/python-pycairo.mk b/package/python-pycairo/python-pycairo.mk
index b509755680..5a48a2a29a 100644
--- a/package/python-pycairo/python-pycairo.mk
+++ b/package/python-pycairo/python-pycairo.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCAIRO_VERSION = 1.18.1
+PYTHON_PYCAIRO_VERSION = 1.18.2
 PYTHON_PYCAIRO_SOURCE = pycairo-$(PYTHON_PYCAIRO_VERSION).tar.gz
-PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/48/20/5e83af98eb897935bf7dc39455e892ba866feebb9b7c3b392982866f9958
+PYTHON_PYCAIRO_SITE = https://files.pythonhosted.org/packages/3c/1a/c0478ecab31baae50fda9956547788afbd0ca563adc52c9b03cab30f17eb
 PYTHON_PYCAIRO_SETUP_TYPE = setuptools
 PYTHON_PYCAIRO_DEPENDENCIES = cairo
 PYTHON_PYCAIRO_LICENSE = LGPL-2.1 or MPL-1.1
-- 
2.20.1
