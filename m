From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Jul 2021 19:22:11 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/tcpdump: bump to
 version 4.99.1
Message-ID: <20210711164853.F40838FE69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cb13dd7be4b414ecde435be7e22d40aea8bd468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4f8e7b388589888704f84dc17bb8d1146de668ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 4aea5b7cb5..1990aa797b 100644
--- a/package/tcpdump/tcpdump.hash
+++ b/package/tcpdump/tcpdump.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature at
-# https://www.tcpdump.org/release/tcpdump-4.99.0.tar.gz.sig
+# https://www.tcpdump.org/release/tcpdump-4.99.1.tar.gz.sig
 # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
-sha256  8cf2f17a9528774a7b41060323be8b73f76024f7778f59c34efa65d49d80b842  tcpdump-4.99.0.tar.gz
+sha256  79b36985fb2703146618d87c4acde3e068b91c553fb93f021a337f175fd10ebe  tcpdump-4.99.1.tar.gz
 sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd  LICENSE
diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index c562034a4e..7741c3b58e 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TCPDUMP_VERSION = 4.99.0
+TCPDUMP_VERSION = 4.99.1
 TCPDUMP_SITE = https://www.tcpdump.org/release
 TCPDUMP_LICENSE = BSD-3-Clause
 TCPDUMP_LICENSE_FILES = LICENSE
