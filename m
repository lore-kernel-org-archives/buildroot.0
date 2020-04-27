From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:26:40 +0200
Subject: [Buildroot] [git commit] package/waf: bump to version 2.0.20
Message-ID: <20200427201157.8C2A19094A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3d3e5888b343214233aba30ad70815bfee5a368
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switch to the new 2 spaces convention for the hash file

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/waf/waf.hash | 4 ++--
 package/waf/waf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 572562cf92..15db32f384 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha1    d857c29d49848e0fc42e69daa25e0ec2e732ac17                          waf-2.0.19
-sha256  ba63c90a865a9bcf46926c4e6776f9a3f73d29f33d49b7f61f96bc37b7397cef  waf-2.0.19
+sha1  92212071a63ce38fdfd69fb8332f04e84d1f6635  waf-2.0.20
+sha256  bf971e98edc2414968a262c6aa6b88541a26c3cd248689c89f4c57370955ee7f  waf-2.0.20
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index ae3eb0f1ed..56b6d9e033 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.0.19
+WAF_VERSION = 2.0.20
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 
