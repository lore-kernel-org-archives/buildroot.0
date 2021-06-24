From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Jun 2021 13:55:34 +0300
Subject: [Buildroot] [PATCH 1/2] package/libpcap: bump to version 1.10.1
Message-ID: <4b481c4db9adfd8660b6de8a4b92c3774542ff78.1624532135.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index e70d071294a5..84c8e405df5a 100644
--- a/package/libpcap/libpcap.hash
+++ b/package/libpcap/libpcap.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.tcpdump.org/release/libpcap-1.10.0.tar.gz.sig
-sha256  8d12b42623eeefee872f123bd0dc85d535b00df4d42e865f993c40f7bfc92b1e  libpcap-1.10.0.tar.gz
+# https://www.tcpdump.org/release/libpcap-1.10.1.tar.gz.sig
+sha256  ed285f4accaf05344f90975757b3dbfe772ba41d1c401c2648b7fa45b711bdd4  libpcap-1.10.1.tar.gz
 
 # Hash for license file:
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 24215ebed54b..1e02ec56e046 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPCAP_VERSION = 1.10.0
+LIBPCAP_VERSION = 1.10.1
 LIBPCAP_SITE = https://www.tcpdump.org/release
 LIBPCAP_LICENSE = BSD-3-Clause
 LIBPCAP_LICENSE_FILES = LICENSE
-- 
2.30.2
