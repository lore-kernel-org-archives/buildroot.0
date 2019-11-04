From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon,  4 Nov 2019 18:13:12 +0100
Subject: [Buildroot] [PATCH] package/cppzmq: bump to version 4.5.0
Message-ID: <1572887592-18401-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/cppzmq/cppzmq.hash | 2 +-
 package/cppzmq/cppzmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 58b91b5..98b365f 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 117fc1ca24d98dbe1a60c072cde13be863d429134907797f8e03f654ce679385  cppzmq-4.4.1.tar.gz
+sha256 64eb4e58eaf0c77505391c6c9a606cffcb57c6086f3431567a1ef4a25b01fa36  cppzmq-4.5.0.tar.gz
 sha256 7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 95c0880..7b65383 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.4.1
+CPPZMQ_VERSION = 4.5.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.7.4
