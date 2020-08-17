From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 17 Aug 2020 17:53:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-requests : bump to version
 2.24.0
Message-ID: <1597679613-16485-1-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index b252e3a..84bf2a1 100644
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
index 9d36346..eb3997f 100644
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
-- 
2.7.4
