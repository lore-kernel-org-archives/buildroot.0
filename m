From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Dec 2018 23:12:01 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/python-requests:
 bump version to 2.19.1
Message-ID: <20181217221807.C1837815EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35f0fba38cf953fd24d7403ae2bc9116eec4553f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Updated package using scanpypi, added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 217fa315abca43579bb47637881fe4127da6584b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-requests/python-requests.hash | 8 +++++---
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 2f182ea3bd..b71fe86ee7 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/requests/json, sha256 locally computed
-md5	40f723ed01dddeaf990d0609d073f021  requests-2.18.1.tar.gz
-sha256	c6f3bdf4a4323ac7b45d01e04a6f6c20e32a052cd04de81e05103abc049ad9b9  requests-2.18.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/requests/json
+md5	6c1a31afec9d614e2e71a91ee6ca2878  requests-2.19.1.tar.gz
+sha256	ec22d826a36ed72a7358ff3fe56cbd4ba69dd7a6718ffd450ff0e9df7a47ce6a  requests-2.19.1.tar.gz
+# Locally computed sha256 checksums
+sha256	82a869fe4e967449956d26a546adc762acace028852ce81ba16c3c5b1d76b15b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 504eb8d0ad..881d196526 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.18.1
+PYTHON_REQUESTS_VERSION = 2.19.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://pypi.python.org/packages/2c/b5/2b6e8ef8dd18203b6399e9f28c7d54f6de7b7549853fe36d575bd31e29a7
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
