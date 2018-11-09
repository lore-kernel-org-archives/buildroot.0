From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 9 Nov 2018 22:20:49 +0100
Subject: [Buildroot] [git commit] package/python-mwclient: bump version to
 0.9.2
Message-ID: <20181109211820.7D20E821BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f434b9c4bc9070c9036e420ff5dbce707a283956
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mwclient/python-mwclient.hash | 4 ++--
 package/python-mwclient/python-mwclient.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index a20950a249..fccfbcdcb6 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mwclient/json
-md5	b9fc00d68dbf4a3db4ca476d438d6b57  mwclient-0.9.1.tar.gz
-sha256	ed7a0eeb98f0309946ae8762b60eae10eb507e4b67400931ec24abd0aee3d7b4  mwclient-0.9.1.tar.gz
+md5	994337c4153d86345f2dfdf74e53b546  mwclient-0.9.2.tar.gz
+sha256	60ed0b13fdef8cb2ce4dde79bc92dd729de093e86f188225b4bcd73e32d75282  mwclient-0.9.2.tar.gz
 # Locally computed
 sha256	d29eaa80939b6d8fc3ab458bab90f4af879fa9e0430ed7e0fb2b94752e7eb33f  mwclient/__init__.py
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 7edf05add1..0e20dd6261 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.9.1
+PYTHON_MWCLIENT_VERSION = 0.9.2
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/1b/9b/c790760100c336e596b99ad13537fda36c13ea6f289b88594e9ad0d90a1e
+PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/f8/5a/9a5cf29e256c5720b9dc3b60586be6557e5f8bbf313d90bf75b0d967f0af
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = mwclient/__init__.py
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
