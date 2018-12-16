From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 09:56:45 +0100
Subject: [Buildroot] [PATCH 01/12] argparse: bump to version 0.6.0
Message-ID: <20181216085656.30105-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/argparse/argparse.hash | 2 +-
 package/argparse/argparse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
index a4746bc6a..850de2f67 100644
--- a/package/argparse/argparse.hash
+++ b/package/argparse/argparse.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e00e5637c937d7bfca96025f2c598ba4fffe9eb818d69952e77b4c08167a6be3  argparse-0.5.0-1.src.rock
+sha256 e4029f42d61cbdde1540e0a098a24b1fed0bc8a2803efe2a0d0d3e7f2f2f2c82  argparse-0.6.0-1.src.rock
diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
index 095f0a315..2b0094ddb 100644
--- a/package/argparse/argparse.mk
+++ b/package/argparse/argparse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARGPARSE_VERSION_UPSTREAM = 0.5.0
+ARGPARSE_VERSION_UPSTREAM = 0.6.0
 ARGPARSE_VERSION = $(ARGPARSE_VERSION_UPSTREAM)-1
 ARGPARSE_SUBDIR = argparse
 ARGPARSE_LICENSE = MIT
-- 
2.17.1
