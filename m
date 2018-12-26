From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 22:23:57 +0100
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.5.0
Message-ID: <20181226211934.D6F94838D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=689082581446b3a4afce81b433ce7bda89707fd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 8f158af3cb..c76f49b4a4 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5	80a6e0c6c452d511d1d37755d6f0995a  aiohttp-3.4.4.tar.gz
-sha256	51afec6ffa50a9da4cdef188971a802beb1ca8e8edb40fa429e5e529db3475fa  aiohttp-3.4.4.tar.gz
+md5	b692d5c602458957a0ef2df92ac48705  aiohttp-3.5.0.tar.gz
+sha256	1d00d58cf2665ce61bd637790988accca609aa3a898bb45747b6369830c0de28  aiohttp-3.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256	bb0c0eeae85492ebfa03442b7784d4c42a623e15346df54ae85f55df972a82af  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index df8bdfb4b2..c17daf6a27 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.4.4
+PYTHON_AIOHTTP_VERSION = 3.5.0
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/70/27/6098b4b60a3302a97f8ec97eb85d42f55a2fa904da4a369235a8e3b84352
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/e4/a4/48e455139e03dc1555f904cf3843c9228c2a922f61512eb4d2482e04135c
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
