From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:00:37 +0200
Subject: [Buildroot] [git commit] czmq: bump to version 4.1.1
Message-ID: <20180404200055.E535C83F36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9ca8fa8ddd71109882f21b1bc232d564dec9887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/czmq/czmq.hash | 6 +++---
 package/czmq/czmq.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index c0a7176f8d..c42525c78d 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,6 +1,6 @@
 # From https://github.com/zeromq/czmq/releases
-md5 d29baef1079f19a2c6a360eb6be984f8 czmq-4.1.0.tar.gz
-sha1 1d201a87205811367f7c92cbbd36a899edda68bf czmq-4.1.0.tar.gz
+md5 6d3a6fdd25c2bb29897c53670dce97bf czmq-4.1.1.tar.gz
+sha1 629d34e8b5c1f2dd88689350f71f9917a8d76f23 czmq-4.1.1.tar.gz
 # Locally calculated
-sha256 3befa35b4886b5298e8329b4f0aa5bb9bde0e7439bd3c5c53295cb988371fc11 czmq-4.1.0.tar.gz
+sha256 f00ff419881dc2a05d0686c8467cd89b4882677fc56f31c0e2cc81c134cbb0c0 czmq-4.1.1.tar.gz
 sha256 1f256ecad192880510e84ad60474eab7589218784b9a50bc7ceee34c2b91f1d5 LICENCE
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index aef552415e..6eb9314200 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = 4.1.0
+CZMQ_VERSION = 4.1.1
 CZMQ_SITE = https://github.com/zeromq/czmq/releases/download/v$(CZMQ_VERSION)
 
 # 0001-configure.ac-remove-Werror.patch touches configure.ac
