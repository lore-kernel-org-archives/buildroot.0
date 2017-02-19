From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 19 Feb 2017 14:12:43 -0500
Subject: [Buildroot] [PATCH 46/58] python-requests: bump to version 2.13.0
In-Reply-To: <20170219191255.1503-1-Adamduskett@outlook.com>
References: <20170219191255.1503-1-Adamduskett@outlook.com>
Message-ID: <20170219191255.1503-47-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index e441c00..8faa9d0 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/requests/json, sha256 locally computed
-md5	ad5f9c47b5c5dfdb28363ad7546b0763  requests-2.11.1.tar.gz
-sha256	5acf980358283faba0b897c73959cecf8b841205bb4b2ad3ef545f46eae1a133  requests-2.11.1.tar.gz
+md5 921ec6b48f2ddafc8bb6160957baf444 requests-2.13.0.tar.gz
+sha256 5722cd09762faa01276230270ff16af7acf7c5c45d623868d9ba116f15791ce8 requests-2.13.0.tar.gz
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 49980bf..13bbdfb 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.11.1
+PYTHON_REQUESTS_VERSION = 2.13.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://pypi.python.org/packages/2e/ad/e627446492cc374c284e82381215dcd9a0a87c4f6e90e9789afefe6da0ad
+PYTHON_REQUESTS_SITE = https://pypi.python.org/packages/16/09/37b69de7c924d318e51ece1c4ceb679bf93be9d05973bb30c35babd596e2
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.9.3
