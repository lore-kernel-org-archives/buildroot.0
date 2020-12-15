From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Tue, 15 Dec 2020 15:04:07 +0100
Subject: [Buildroot] [PATCH] package/python-requests: bump to version 2.25.0
Message-ID: <20201215140407.57321-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE file content has been changed ([1]) to follow Apache-2.0
instructions.

[1] https://github.com/psf/requests/commit/22b5a39098223f51fcd2df238e13f9bac86b35a4

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/python-requests/python-requests.hash | 6 +++---
 package/python-requests/python-requests.mk   | 4 ++--
 package/python3-requests/python3-requests.mk | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 84bf2a1aa0..95725a3552 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  b54bff26a389e5932e8b1c4983a99ce7  requests-2.24.0.tar.gz
-sha256  b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b  requests-2.24.0.tar.gz
+md5  94cd712029077897e252212c5f402b79  requests-2.25.0.tar.gz
+sha256  7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8  requests-2.25.0.tar.gz
 # Locally computed sha256 checksums
-sha256  8837a2f33a61bcee175c028ff16d1c160aba48a3aebe1495ace709be4e62636b  LICENSE
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index eb3997f108..8c7b6c6748 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-requests/python3-requests.mk
-PYTHON_REQUESTS_VERSION = 2.24.0
+PYTHON_REQUESTS_VERSION = 2.25.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/da/67/672b422d9daf07365259958912ba533a0ecab839d4084c487a5fe9a5405f
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9f/14/4a6542a078773957aa83101336375c9597e6fe5889d20abda9c38f9f3ff2
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
diff --git a/package/python3-requests/python3-requests.mk b/package/python3-requests/python3-requests.mk
index cd6a7e1260..2e10c636af 100644
--- a/package/python3-requests/python3-requests.mk
+++ b/package/python3-requests/python3-requests.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python-requests/python-requests.mk
-PYTHON3_REQUESTS_VERSION = 2.24.0
+PYTHON3_REQUESTS_VERSION = 2.25.0
 PYTHON3_REQUESTS_SOURCE = requests-$(PYTHON3_REQUESTS_VERSION).tar.gz
-PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915
+PYTHON3_REQUESTS_SITE = https://files.pythonhosted.org/packages/9f/14/4a6542a078773957aa83101336375c9597e6fe5889d20abda9c38f9f3ff2
 PYTHON3_REQUESTS_SETUP_TYPE = setuptools
 PYTHON3_REQUESTS_LICENSE = Apache-2.0
 PYTHON3_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.29.2
