From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 Jul 2009 23:35:41 +0200
Subject: [Buildroot] [git commit] openssl: remove invalid quotes around
	x86_64
Message-ID: <20090729213626.D7E16777F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8162f3977a36b0c1f9e06daf2b3931d0074cd51c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks for Thomas for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 16938f4..8c24db1 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -18,7 +18,7 @@ endif
 ifeq ($(ARCH),powerpc)
 OPENSSL_TARGET_ARCH=ppc
 endif
-ifeq ($(ARCH),"x86_64")
+ifeq ($(ARCH),x86_64)
 OPENSSL_TARGET_ARCH=x86_64
 endif
 
-- 
1.6.3.3
