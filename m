From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 16 Mar 2020 17:40:23 +0100
Subject: [Buildroot] [PATCH 3/4] package/ell: bump to version 0.28
In-Reply-To: <20200316164024.540598-1-joerg.krause@embedded.rocks>
References: <20200316164024.540598-1-joerg.krause@embedded.rocks>
Message-ID: <20200316164024.540598-3-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes since version 0.24:

0.28:
  Fix issue with NULL check of D-Bus proxy for method calls.
  Add support for emitting D-Bus property changes on demand.
  Add support for reporting file attribute changes.

0.27:
  Fix issue with data overflow and multiple PEMs.
  Fix issue with handling DHCP lease expiration.

0.26:
  Fix issue with memory leak and TLS certificates.
  Fix issue with buffer size and TLS PRF handling.
  Add support for D-Bus non-root ObjectManager.

0.25:
  Fix issue with stopping DHCP client and owner notification.
  Fix issue with time calculation overflow and DHCP.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 02e6e27b53..7e4abcc844 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 b6a4b46807391ea69f9271074cc778aa74263af2bea3f797ab0c092e8dedd21f ell-0.24.tar.gz
+sha256 f7d41781eebcec5795554249400895532460bcf533f2a55ee0c3b9c792dda42d ell-0.28.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 6cafdd73d5..664976af9f 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.24
+ELL_VERSION = 0.28
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
-- 
2.25.1
