From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:31:03 +0200
Subject: [Buildroot] [git commit] package/python-requests : bump to version
 2.24.0
Message-ID: <20200902161635.71BFB85EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a01bf684ea0d6eed9755bb4bf43986720ede722e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index b252e3a781..84bf2a1aa0 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  abfdc28db1065bbd0bc32592ac9d27a6  requests-2.23.0.tar.gz
-sha256  b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6  requests-2.23.0.tar.gz
+md5  b54bff26a389e5932e8b1c4983a99ce7  requests-2.24.0.tar.gz
+sha256  b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b  requests-2.24.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8837a2f33a61bcee175c028ff16d1c160aba48a3aebe1495ace709be4e62636b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 9d36346b65..eb3997f108 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 # Please keep in sync with package/python3-requests/python3-requests.mk
-PYTHON_REQUESTS_VERSION = 2.23.0
+PYTHON_REQUESTS_VERSION = 2.24.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/da/67/672b422d9daf07365259958912ba533a0ecab839d4084c487a5fe9a5405f
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
