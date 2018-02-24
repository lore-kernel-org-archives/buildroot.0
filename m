From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 24 Feb 2018 18:43:05 +0200
Subject: [Buildroot] [PATCH 1/1] czmq: bump to version v4.1.0
Message-ID: <20180224164305.6133-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/czmq/czmq.hash | 2 +-
 package/czmq/czmq.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index 526ea594b9..77fdda0863 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5c76de41f736f0c059e0b26174ef99200f2aba2fa38333683dbe4944b2f80555 czmq-5205ec201e97c3a652c17eb86b18b70350b54512.tar.gz
+sha256 2e87c19988d1168b70d7ec0fdce79aba4e92a6330959c3a2576c72b319acb478 czmq-v4.1.0.tar.gz
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 5305789d7a..c9a6b3c66a 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = 5205ec201e97c3a652c17eb86b18b70350b54512
+CZMQ_VERSION = v4.1.0
 CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
 
 # Autoreconf required as we use the git tree
-- 
2.14.1
