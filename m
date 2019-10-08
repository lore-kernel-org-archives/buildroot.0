From: Asaf Kahlon <asafka7@gmail.com>
Date: Tue,  8 Oct 2019 16:08:08 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-channels: bump to version
 2.3.0
In-Reply-To: <20191008130810.27342-1-asafka7@gmail.com>
References: <20191008130810.27342-1-asafka7@gmail.com>
Message-ID: <20191008130810.27342-5-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-channels/python-channels.hash | 4 ++--
 package/python-channels/python-channels.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-channels/python-channels.hash b/package/python-channels/python-channels.hash
index 539589e433..00e090ef13 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5	aec056cf4d0fa6444b3d83ccd5885fc5  channels-2.2.0.tar.gz
-sha256	af7cdba9efb3f55b939917d1b15defb5d40259936013e60660e5e9aff98db4c5  channels-2.2.0.tar.gz
+md5	0e225281099fce5cd0f6e247c966120f  channels-2.3.0.tar.gz
+sha256	5759b4b89fc354101299e5f24b49e83421c12c653c913161858be4c24364a26d  channels-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index a0f4591f76..2b55148f7e 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 2.2.0
+PYTHON_CHANNELS_VERSION = 2.3.0
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/26/b9/92c803f3e8e304efbfbcd0634d4a5ad2d231f515b968f1b9e7c84ee78012
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/ad/69/fb21d6db9c4906a0e044812d15d99dcf2e98153dcf5bf2be48f833394670
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
-- 
2.20.1
