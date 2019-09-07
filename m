From: sam at gpsm.co.uk <sam@gpsm.co.uk>
Date: Sat,  7 Sep 2019 21:14:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/supervisor: bump to version 3.4.0
Message-ID: <20190907201408.9367-1-sam@gpsm.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Lancia <sam@gpsm.co.uk>

Signed-off-by: Sam Lancia <sam@gpsm.co.uk>
---
 package/supervisor/supervisor.hash | 2 +-
 package/supervisor/supervisor.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index 0ebc663be9..03b06bdf2b 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 82f75089f719a7a3ca87f35c89a03c20fd3c0912552c96eb6fa40274ced6604e  supervisor-3.1.4.tar.gz
+sha256 31102eeb323fbe57384d6a3746beab8f9ae9db705cdbd04a0861d21e38907a45  supervisor-3.4.0.tar.gz
 sha256 a85a622378c6a892ead1ce5d0488e446e106bf014d3b763fdbc1ad1ae38ee491  COPYRIGHT.txt
 sha256 27ba0b2357ed6974d755ed53232c5ab8595622b3111bb91682708ea188cc3696  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 9b93b449a7..216e07aca3 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 3.1.4
-SUPERVISOR_SITE = https://pypi.python.org/packages/12/50/cd330d1a0daffbbe54803cb0c4c1ada892b5d66db08befac385122858eee
+SUPERVISOR_VERSION = 3.4.0
+SUPERVISOR_SITE = https://pypi.python.org/packages/19/0a/7eef85a26f8dfb585f312e4c6b76b0b16fe800ffce8a4724a7bda6ef440d
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa), ZPL-2.1
 SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
-- 
2.17.1
