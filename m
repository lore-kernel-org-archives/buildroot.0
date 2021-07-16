From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 22:59:07 +0200
Subject: [Buildroot] [git commit] package/python-aiodns: bump to version
 3.0.0
Message-ID: <20210716202900.D0FDD9111F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=e8b2a586b9adfeff2f21ce101a8557e209aebfd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiodns/python-aiodns.hash | 6 +++---
 package/python-aiodns/python-aiodns.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiodns/python-aiodns.hash b/package/python-aiodns/python-aiodns.hash
index c9511ce776..2cdedc6f95 100644
--- a/package/python-aiodns/python-aiodns.hash
+++ b/package/python-aiodns/python-aiodns.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiodns/json
-md5	3e121f9eb7ef3ba3556ba7ec28c6f63a  aiodns-2.0.0.tar.gz
-sha256	815fdef4607474295d68da46978a54481dd1e7be153c7d60f9e72773cd38d77d  aiodns-2.0.0.tar.gz
+md5  181e11935c78965de2b2b7b0e5efba8d  aiodns-3.0.0.tar.gz
+sha256  946bdfabe743fceeeb093c8a010f5d1645f708a241be849e17edfb0e49e08cd6  aiodns-3.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
+sha256  eb0455d35129425ed399883cd710923de3e246a510e2eb84d9f00032d0bbec97  LICENSE
diff --git a/package/python-aiodns/python-aiodns.mk b/package/python-aiodns/python-aiodns.mk
index f02b4b75a3..2318dcab3a 100644
--- a/package/python-aiodns/python-aiodns.mk
+++ b/package/python-aiodns/python-aiodns.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIODNS_VERSION = 2.0.0
+PYTHON_AIODNS_VERSION = 3.0.0
 PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
-PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/30/2e/b86ce168485b68d40c6a810838669deacf0abf41845c383659c2b613e69f
+PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/27/79/df72e25df0fdd9bf5a5ab068539731d27c5f2ae5654621ae0c92ceca94cf
 PYTHON_AIODNS_SETUP_TYPE = setuptools
 PYTHON_AIODNS_LICENSE = MIT
 PYTHON_AIODNS_LICENSE_FILES = LICENSE
