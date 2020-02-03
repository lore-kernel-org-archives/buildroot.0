From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 15:29:52 +0100
Subject: [Buildroot] [git commit] package/waf: bump to version 2.0.19
Message-ID: <20200203141853.BA42B888D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43f7e2fe611a73294d38abd20c9b07fa07530796
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add myself as DEVELOPER, as waf is currently orphan,
and I am the last one to fiddle with it.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS           | 1 +
 package/waf/waf.hash | 4 ++--
 package/waf/waf.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32c28d62fd..172ebbf43a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2452,6 +2452,7 @@ F:	package/avro-c/
 F:	package/mosquitto/
 F:	package/python-avro/
 F:	package/redis/
+F:	package/waf/
 
 N:	Trent Piepho <tpiepho@impinj.com>
 F:	package/libp11/
diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 9d610b2c1e..572562cf92 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha1    33d170c738ed8c92dda2945b445272972f558244                          waf-1.9.5
-sha256  101f14e0f47a6410c00b8feda094948516cd3989491c56eb8268907fcd164909  waf-1.9.5
+sha1    d857c29d49848e0fc42e69daa25e0ec2e732ac17                          waf-2.0.19
+sha256  ba63c90a865a9bcf46926c4e6776f9a3f73d29f33d49b7f61f96bc37b7397cef  waf-2.0.19
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 97bc2a8963..ae3eb0f1ed 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 1.9.5
+WAF_VERSION = 2.0.19
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 
