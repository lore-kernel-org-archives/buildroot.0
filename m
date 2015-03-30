From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 17:54:55 +0200
Subject: [Buildroot] [git commit] musl: security bump to version 1.1.8
Message-ID: <20150330155458.CD274803BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0a944fad87c4e459d3c68df47e72a9f7e227c79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-1817 - stack-based buffer overflow in IPv6 literal parsing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.hash |    2 +-
 package/musl/musl.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 0e6a2f9..20bb2f8 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d8e0aae287ecf8aa6500d3ed4131f33d216a7857dc7649a89125ffca6bf91599	musl-1.1.7.tar.gz
+sha256	fa928506415b9c555977daaf874c190eaf7fbbd16028cc5c5f33a00a83227813	musl-1.1.8.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 86674ca..6cba5bb 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.7
+MUSL_VERSION = 1.1.8
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
