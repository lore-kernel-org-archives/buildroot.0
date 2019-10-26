From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 26 Oct 2019 18:22:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/supervisor: Bump to v4.1.0
In-Reply-To: <20191026162219.144819-1-titouan.christophe@railnova.eu>
References: <20191026162219.144819-1-titouan.christophe@railnova.eu>
Message-ID: <20191026162219.144819-2-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/supervisor/supervisor.hash | 2 +-
 package/supervisor/supervisor.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index 0ebc663be9..95d7dfb76b 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 82f75089f719a7a3ca87f35c89a03c20fd3c0912552c96eb6fa40274ced6604e  supervisor-3.1.4.tar.gz
+sha256 2dc86fe0476e945e61483d614ceb2cf4f93b95282eb243bdf792621994360383  supervisor-4.1.0.tar.gz
 sha256 a85a622378c6a892ead1ce5d0488e446e106bf014d3b763fdbc1ad1ae38ee491  COPYRIGHT.txt
 sha256 27ba0b2357ed6974d755ed53232c5ab8595622b3111bb91682708ea188cc3696  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index 9b93b449a7..6cf5163096 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 3.1.4
-SUPERVISOR_SITE = https://pypi.python.org/packages/12/50/cd330d1a0daffbbe54803cb0c4c1ada892b5d66db08befac385122858eee
+SUPERVISOR_VERSION = 4.1.0
+SUPERVISOR_SITE = https://files.pythonhosted.org/packages/de/87/ee1ad8fa533a4b5f2c7623f4a2b585d3c1947af7bed8e65bc7772274320e
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa), ZPL-2.1
 SUPERVISOR_LICENSE_FILES = COPYRIGHT.txt LICENSES.txt
 SUPERVISOR_SETUP_TYPE = setuptools
-- 
2.21.0
