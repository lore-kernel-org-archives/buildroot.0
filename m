From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Jun 2021 13:55:35 +0300
Subject: [Buildroot] [PATCH 2/2] package/tcpdump: bump to version 4.99.1
In-Reply-To: <4b481c4db9adfd8660b6de8a4b92c3774542ff78.1624532135.git.baruch@tkos.co.il>
References: <4b481c4db9adfd8660b6de8a4b92c3774542ff78.1624532135.git.baruch@tkos.co.il>
Message-ID: <513a973551bf9459ee3c2b19e8fb9feb8fa9ca5f.1624532135.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpdump/tcpdump.hash | 4 ++--
 package/tcpdump/tcpdump.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
index 4aea5b7cb5a9..1990aa797bce 100644
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
index c562034a4e7c..7741c3b58ed3 100644
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
-- 
2.30.2
