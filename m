From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 11:34:17 +0100
Subject: [Buildroot] [git commit] package/python-aiodns: bump to version
 2.0.0
Message-ID: <20190317103310.953428EA12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d13163e976da3fbfe8a4758af0d0e0c6bc38629c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiodns/python-aiodns.hash | 4 ++--
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index b66693f869..c9511ce776 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5	80e0419b49bb4c540b4857ec142219b8  aiodns-1.1.1.tar.gz
-sha256	d8677adc679ce8d0ef706c14d9c3d2f27a0e0cc11d59730cdbaf218ad52dd9ea  aiodns-1.1.1.tar.gz
+md5	3e121f9eb7ef3ba3556ba7ec28c6f63a  aiodns-2.0.0.tar.gz
+sha256	815fdef4607474295d68da46978a54481dd1e7be153c7d60f9e72773cd38d77d  aiodns-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256	eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index 94f719d39e..f02b4b75a3 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 1.1.1
+PYTHON_AIODNS_VERSION = 2.0.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/3b/45/dcee156eabca900af3a1bab8acb9531636b13db4b677d44ba468a43969e0
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/30/2e/b86ce168485b68d40c6a810838669deacf0abf41845c383659c2b613e69f
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
