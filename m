From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Apr 2020 22:09:50 +0200
Subject: [Buildroot] [git commit] package/python-treq: bump to version 20.3.0
Message-ID: <20200417195533.842128EF90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0c37350fbbba327da37b59d347b0c1197859a64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-treq/python-treq.hash | 4 ++--
 package/python-treq/python-treq.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index a2c0ea33f1..288279cbd8 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/treq/json
-md5	a8e33a4b3259b45e08e1e0a5960f76f7  treq-18.6.0.tar.gz
-sha256	91e09ff6b524cc90aa5e934b909c8d0d1a9d36ebd618b6c38e37b17013e69f48  treq-18.6.0.tar.gz
+md5  b75f6c89fd481989a9cfdec8d61a6d84  treq-20.3.0.tar.gz
+sha256  a72d7587d6f81c7a32620b00175825b4334bafbde73d37098d139ac7b11dca98  treq-20.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index a79e2bac73..320f57b6f2 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 18.6.0
+PYTHON_TREQ_VERSION = 20.3.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://pypi.python.org/packages/cb/c5/c83628d7e1a5d62a71eab0a5d1cdcdc53b49ead873f52975457ff2a8ae21
+PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/98/09/25064d7224efde9fd51e8865353d516c53306e476eab27ab21fb258cf7d4
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
