From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Aug 2019 22:17:34 +0200
Subject: [Buildroot] [git commit branch/next] package/python-futures: bump
 to version 3.3.0
Message-ID: <20190829202159.AFFC98839D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8a33b531d22b3a4e61bf316b268e0c0562017cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-futures/python-futures.hash | 4 ++--
 package/python-futures/python-futures.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-futures/python-futures.hash b/package/python-futures/python-futures.hash
index db6bb55ea2..a4fbdf4fe9 100644
--- a/package/python-futures/python-futures.hash
+++ b/package/python-futures/python-futures.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/futures/json
-md5	d1b299a06b96ccb59f70324716dc0016  futures-3.2.0.tar.gz
-sha256	9ec02aa7d674acb8618afb127e27fde7fc68994c0437ad759fa094a574adb265  futures-3.2.0.tar.gz
+md5	b43a39ae1475e3fd6940f2b4f7214675  futures-3.3.0.tar.gz
+sha256	7e033af76a5e35f58e56da7a91e687706faf4e7bdfb2cbc3f2cca6b9bcda9794  futures-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	a698bd5d441e4a16af6c992b8e80cbfa12755d72d910854fa1fb11d4deb0059a  LICENSE
diff --git a/package/python-futures/python-futures.mk b/package/python-futures/python-futures.mk
index d6366f30ed..0666948115 100644
--- a/package/python-futures/python-futures.mk
+++ b/package/python-futures/python-futures.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FUTURES_VERSION = 3.2.0
+PYTHON_FUTURES_VERSION = 3.3.0
 PYTHON_FUTURES_SOURCE = futures-$(PYTHON_FUTURES_VERSION).tar.gz
-PYTHON_FUTURES_SITE = https://files.pythonhosted.org/packages/1f/9e/7b2ff7e965fc654592269f2906ade1c7d705f1bf25b7d469fa153f7d19eb
+PYTHON_FUTURES_SITE = https://files.pythonhosted.org/packages/47/04/5fc6c74ad114032cd2c544c575bffc17582295e9cd6a851d6026ab4b2c00
 PYTHON_FUTURES_SETUP_TYPE = setuptools
 PYTHON_FUTURES_LICENSE = BSD-2-Clause
 PYTHON_FUTURES_LICENSE_FILES = LICENSE
