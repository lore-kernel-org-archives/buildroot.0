From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:07:05 +0100
Subject: [Buildroot] [git commit] argparse: bump to version 0.6.0
Message-ID: <20181216110337.97FD58D54D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2366be4943d77aa8b0c300c13cc0aa3a1d97f06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/argparse/argparse.hash | 2 +-
 package/argparse/argparse.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
index a4746bc6af..850de2f670 100644
--- a/package/argparse/argparse.hash
+++ b/package/argparse/argparse.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	e00e5637c937d7bfca96025f2c598ba4fffe9eb818d69952e77b4c08167a6be3  argparse-0.5.0-1.src.rock
+sha256 e4029f42d61cbdde1540e0a098a24b1fed0bc8a2803efe2a0d0d3e7f2f2f2c82  argparse-0.6.0-1.src.rock
diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
index 095f0a315c..2b0094ddb3 100644
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
