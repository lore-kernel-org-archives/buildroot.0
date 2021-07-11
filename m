From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Jul 2021 19:22:09 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/libpcap: bump to
 version 1.10.1
Message-ID: <20210711164853.DB9A195485@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c062f54d18b5850eb158357b550b2a9f454cb07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a9ee2de773a14b36a4e759f1cbaed8a7bebf9a6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.hash | 4 ++--
 package/libpcap/libpcap.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpcap/libpcap.hash b/package/libpcap/libpcap.hash
index e70d071294..84c8e405df 100644
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
index 24215ebed5..1e02ec56e0 100644
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
