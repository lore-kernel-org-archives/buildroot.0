From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 22:19:14 +0200
Subject: [Buildroot] [git commit] package/python-certifi: bump to version
 2019.9.11
Message-ID: <20191002201426.84C0B882F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f660a634920930cc92dfda8b96cc3ad285801284
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index 57fe9dc641..122ad55cad 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5	af8fea5f3df6f7f81e9c6cbc6dd7c1e8  certifi-2019.6.16.tar.gz
-sha256	945e3ba63a0b9f577b1395204e13c3a231f9bc0223888be653286534e5873695  certifi-2019.6.16.tar.gz
+md5	cadd4e373fc08f649fa39b82aed9ad96  certifi-2019.9.11.tar.gz
+sha256	e4f3620cfea4f83eedc95b24abd9cd56f3c4b146dd0177e83a21b4eb49e21e50  certifi-2019.9.11.tar.gz
 # Locally computed sha256 checksums
 sha256	6a70a4bf6b010016d59a64b8ae4ad8dc7f5ef16f1fb453cc2ecd771c5a341131  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index f8a6706615..e614b8356e 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2019.6.16
+PYTHON_CERTIFI_VERSION = 2019.9.11
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/c5/67/5d0548226bcc34468e23a0333978f0e23d28d0b3f0c71a151aef9c3f7680
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/62/85/7585750fd65599e88df0fed59c74f5075d4ea2fe611deceb95dd1c2fb25b
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
