From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 10:01:31 +0200
Subject: [Buildroot] [git commit] python-pycryptodomex: update license info
Message-ID: <20181014080111.B99A08367C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3162b9ad92c50339192c2fc115b36c953468397
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Clarify OCB license details, and add Doc/LEGAL/COPYRIGHT.pycrypto
to the license files list.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pycryptodomex/python-pycryptodomex.hash | 1 +
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 3dec1a1442..79fe74a871 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -3,3 +3,4 @@ md5	7e1884f55077ed2e48d36565525b1657  pycryptodomex-3.6.6.tar.gz
 sha256	d0d448484e161786922b41e112b5d7cf76ef5f0c725ea5107ef866bb14a38b12  pycryptodomex-3.6.6.tar.gz
 # Locally computed sha256 checksums
 sha256	fc884f6492490d0f227613ee900ff2a27e6879b79ee637c53a4697238bf12970  LICENSE.rst
+sha256	8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 828f93632e..89b6a10fc9 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -11,7 +11,7 @@ PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
 	Public Domain (pycrypto original code), \
-	OCB license (OCB cypher)
-PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst
+	OCB patent license (OCB mode)
+PYTHON_PYCRYPTODOMEX_LICENSE_FILES = LICENSE.rst Doc/LEGAL/COPYRIGHT.pycrypto
 
 $(eval $(python-package))
