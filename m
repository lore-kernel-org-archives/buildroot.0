From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Aug 2020 23:30:40 +0200
Subject: [Buildroot] [git commit branch/next] package/python-urllib3: bump
 to version 1.25.10
Message-ID: <20200818212412.6DD958230F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f737aaac1eebc43d21ee1f6681a9fe9972bfe88c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-urllib3/python-urllib3.hash | 2 +-
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index b1602350bd..6be3671a3c 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,4 +1,4 @@
 # sha256 from https://pypi.org/pypi/urllib3/json
-sha256	3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527  urllib3-1.25.9.tar.gz
+sha256	91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a  urllib3-1.25.10.tar.gz
 # Locally computed sha256 checksums
 sha256	7c0d136ee0585389adf2d25671bb99687a1f75929f465b7f16ee3f01da37255e  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index b17a4c0cb6..e64ff136ab 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 1.25.9
+PYTHON_URLLIB3_VERSION = 1.25.10
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/05/8c/40cd6949373e23081b3ea20d5594ae523e681b6f472e600fbc95ed046a36
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/81/f4/87467aeb3afc4a6056e1fe86626d259ab97e1213b1dfec14c7cb5f538bf0
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
