From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  1 Nov 2019 19:04:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-channels: bump to version
 2.3.1
In-Reply-To: <20191101170417.29286-1-asafka7@gmail.com>
References: <20191101170417.29286-1-asafka7@gmail.com>
Message-ID: <20191101170417.29286-4-asafka7@gmail.com>
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
index 00e090ef13..beeef4acc6 100644
--- a/package/python-channels/python-channels.hash
+++ b/package/python-channels/python-channels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/channels/json
-md5	0e225281099fce5cd0f6e247c966120f  channels-2.3.0.tar.gz
-sha256	5759b4b89fc354101299e5f24b49e83421c12c653c913161858be4c24364a26d  channels-2.3.0.tar.gz
+md5	6f3fb75828b681a69372934a09ac3f32  channels-2.3.1.tar.gz
+sha256	6b8ebd93fe0041a23e31c9f4130d92fadb9c0040c0eb377a004540631325a31d  channels-2.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-channels/python-channels.mk b/package/python-channels/python-channels.mk
index 2b55148f7e..c0eca71aa2 100644
--- a/package/python-channels/python-channels.mk
+++ b/package/python-channels/python-channels.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHANNELS_VERSION = 2.3.0
+PYTHON_CHANNELS_VERSION = 2.3.1
 PYTHON_CHANNELS_SOURCE = channels-$(PYTHON_CHANNELS_VERSION).tar.gz
-PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/ad/69/fb21d6db9c4906a0e044812d15d99dcf2e98153dcf5bf2be48f833394670
+PYTHON_CHANNELS_SITE = https://files.pythonhosted.org/packages/75/53/2db9662a52dcedb02a25f87d8efc5e630059967790e4c10887dbd2db2073
 PYTHON_CHANNELS_SETUP_TYPE = setuptools
 PYTHON_CHANNELS_LICENSE = BSD-3-Clause
 PYTHON_CHANNELS_LICENSE_FILES = LICENSE
-- 
2.20.1
