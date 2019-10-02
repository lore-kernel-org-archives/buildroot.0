From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 23:01:15 +0200
Subject: [Buildroot] [git commit] package/python-more-itertools: bump to
 version 7.2.0
Message-ID: <20191002205555.438D38039D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ccae3086d024a82fe767d499394764304a6f6d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-more-itertools/python-more-itertools.hash | 7 ++++---
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 36748cb395..3bb65897c0 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/more-itertools/json, sha256 locally computed
-md5	fef89b28d050e325fbb7eb209e75ab45  more-itertools-4.0.1.tar.gz
-sha256	5d21dcefa19782f9ec9aa64e0bfd903f5024512b1e1f17519800b193b2e64d31  more-itertools-4.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/more-itertools/json
+md5	f647bfd27243a7bebe53b5ddb6a3b1c4  more-itertools-7.2.0.tar.gz
+sha256	409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832  more-itertools-7.2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 971a338626..4932fdc4a0 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 4.0.1
+PYTHON_MORE_ITERTOOLS_VERSION = 7.2.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://pypi.python.org/packages/a2/28/d02c111c230a769a32fd97e9f6d42bfb0136da381f356b945db38367b3d3
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/c2/31/45f61c8927c9550109f1c4b99ba3ca66d328d889a9c9853a808bff1c9fa0
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = setuptools
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
