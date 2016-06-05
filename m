From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 22:00:34 +0200
Subject: [Buildroot] [git commit] package/czmq: bump version
Message-ID: <20160605200530.C8A1881E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d8a69d864bf202f5e369ebafabf3b1284d3c9c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for zyre bump:
https://github.com/zeromq/zyre/issues/442#issuecomment-189127583

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.hash | 3 +--
 package/czmq/czmq.mk   | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/czmq/czmq.hash b/package/czmq/czmq.hash
index 20ed7b6..526ea59 100644
--- a/package/czmq/czmq.hash
+++ b/package/czmq/czmq.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256  e56f8498daf70310b31c42669b2f9b753c5e747eafaff6d4fdac26d72a474b27  czmq-v3.0.2.tar.gz
-sha256  74e003c05ab1391502dff2eaad96a5361b19583cd1ee0ad681c929721c8e1e3a  bcf583633e8b27a9bfbed1e4a717b9373f7446be.patch
+sha256 5c76de41f736f0c059e0b26174ef99200f2aba2fa38333683dbe4944b2f80555 czmq-5205ec201e97c3a652c17eb86b18b70350b54512.tar.gz
diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 2b73b61..8c4de71 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-CZMQ_VERSION = v3.0.2
+CZMQ_VERSION = 5205ec201e97c3a652c17eb86b18b70350b54512
 CZMQ_SITE = $(call github,zeromq,czmq,$(CZMQ_VERSION))
-CZMQ_PATCH = https://github.com/zeromq/czmq/commit/bcf583633e8b27a9bfbed1e4a717b9373f7446be.patch
 
 # Autoreconf required as we use the git tree
 CZMQ_AUTORECONF = YES
