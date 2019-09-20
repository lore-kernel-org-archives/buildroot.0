From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 23:24:14 +0200
Subject: [Buildroot] [git commit] package/libgsm: bump to version 1.0.18
Message-ID: <20190920211952.F3C2B8ED46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee554ea33304bc35d581b9e4194952f6d6683595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgsm/libgsm.hash | 2 +-
 package/libgsm/libgsm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgsm/libgsm.hash b/package/libgsm/libgsm.hash
index 523e629dc4..32e20c8f48 100644
--- a/package/libgsm/libgsm.hash
+++ b/package/libgsm/libgsm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  855a57d1694941ddf3c73cb79b8d0b3891e9c9e7870b4981613b734e1ad07601  gsm-1.0.17.tar.gz
+sha256  04f68087c3348bf156b78d59f4d8aff545da7f6e14f33be8f47d33f4efae2a10  gsm-1.0.18.tar.gz
 sha256  81c68a3374937ed9b5e4929c709e81a2c4b35b5d1f450ecf8c473e2daea46ff6  COPYRIGHT
diff --git a/package/libgsm/libgsm.mk b/package/libgsm/libgsm.mk
index 0add45c5e7..b9ae7d3eeb 100644
--- a/package/libgsm/libgsm.mk
+++ b/package/libgsm/libgsm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGSM_VERSION = 1.0.17
+LIBGSM_VERSION = 1.0.18
 LIBGSM_SOURCE = gsm-$(LIBGSM_VERSION).tar.gz
 LIBGSM_SITE = http://www.quut.com/gsm
 LIBGSM_LICENSE = gsm
