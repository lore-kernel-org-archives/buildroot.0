From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2021 11:29:20 +0100
Subject: [Buildroot] [git commit] package/faad2: bump to version 2.10.0
Message-ID: <20210131101051.E9478813B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c126bb9c7dd373d8f801accd07af6154f7a3559c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index e9aa78051f..2eb11d73aa 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9728b2b94f94ab49363cd229e7377fbe6ef3c311c5cd80da662d53ddb0ee091d  faad2-2.9.2.tar.gz
+sha256  0c6d9636c96f95c7d736f097d418829ced8ec6dbd899cc6cc82b728480a84bfb  faad2-2.10.0.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 69c44461f2..575abad17e 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.9.2
+FAAD2_VERSION = 2.10.0
 FAAD2_SITE = $(call github,knik0,faad2,$(subst .,_,$(FAAD2_VERSION)))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
