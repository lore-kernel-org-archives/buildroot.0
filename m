From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Jan 2021 20:41:13 +0100
Subject: [Buildroot] [PATCH 3/3] package/{python,
 python3}-requests: bump version to 2.25.1
In-Reply-To: <20210101194113.10929-1-bernd.kuhls@t-online.de>
References: <20210101194113.10929-1-bernd.kuhls@t-online.de>
Message-ID: <20210101194113.10929-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 package/python3-requests/python3-requests.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 95725a3552..e07c7bf5cc 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  94cd712029077897e252212c5f402b79  requests-2.25.0.tar.gz
-sha256  7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8  requests-2.25.0.tar.gz
+md5  514d6f7eba77ada0b8c98ec7818828db  requests-2.25.1.tar.gz
+sha256  27973dd4a904a4f13b263a19c866c13b92a39ed1c964655f025f3f8d3d75b804  requests-2.25.1.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 8c7b6c6748..2b543c0f9a 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-requests/python3-requests.mk
-PYTHON_REQUESTS_VERSION = 2.25.0
+PYTHON_REQUESTS_VERSION = 2.25.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9f/14/4a6542a078773957aa83101336375c9597e6fe5889d20abda9c38f9f3ff2
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
diff --git a/package/python3-requests/python3-requests.mk b/package/python3-requests/python3-requests.mk
index 2e10c636af..b67d71a18b 100644
--- a/package/python3-requests/python3-requests.mk
+++ b/package/python3-requests/python3-requests.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-requests/python-requests.mk
-PYTHON3_REQUESTS_VERSION = 2.25.0
+PYTHON3_REQUESTS_VERSION = 2.25.1
 PYTHON3_REQUESTS_SOURCE = requests-$(PYTHON3_REQUESTS_VERSION).tar.gz
-PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/9f/14/4a6542a078773957aa83101336375c9597e6fe5889d20abda9c38f9f3ff2
+PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/6b/47/c14abc08432ab22dc18b9892252efaf005ab44066de871e72a38d6af464b
 PYTHON3_REQUESTS_SETUP_TYPE = setuptools
 PYTHON3_REQUESTS_LICENSE = Apache-2.0
 PYTHON3_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.29.2
