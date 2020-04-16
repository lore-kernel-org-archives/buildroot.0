From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 04:54:52 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 8.2.0
Message-ID: <20200416105452.83076-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 3bb65897c0..1b4ffef2b6 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5	f647bfd27243a7bebe53b5ddb6a3b1c4  more-itertools-7.2.0.tar.gz
-sha256	409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832  more-itertools-7.2.0.tar.gz
+md5  55e7e0a5eabc5a57bc8353c65c6f9965  more-itertools-8.2.0.tar.gz
+sha256  b1ddb932186d8a6ac451e1d95844b382f55e12686d51ca0c68b6f61f2ab7a507  more-itertools-8.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index 4932fdc4a0..334ef5e13a 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 7.2.0
+PYTHON_MORE_ITERTOOLS_VERSION = 8.2.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/c2/31/45f61c8927c9550109f1c4b99ba3ca66d328d889a9c9853a808bff1c9fa0
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/a0/47/6ff6d07d84c67e3462c50fa33bf649cda859a8773b53dc73842e84455c05
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = setuptools
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.20.1
