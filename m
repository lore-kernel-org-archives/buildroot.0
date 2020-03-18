From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 22:43:07 +0100
Subject: [Buildroot] [git commit] package/ccache: bump to version 3.7.8
Message-ID: <20200318213014.E57C582602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e6748ac5187a0b1b9b048c3b22d792dcf3dfe40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ccache/ccache.hash | 2 +-
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 83c172feae..3b9dac28b6 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  b7c1d6d6fe42f18e424de92746af863e0bc85794da3d69e44300840c478c98cd  ccache-3.7.7.tar.xz
+sha256  99ea7b8fc34fdd5dc628169f452086c1f4d8ca3a1e52bd484fbdef3516893672  ccache-3.7.8.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
 sha256  4f63223bcdee822d55a6768cc8399ffe06401d7a03cfe79e1dc305f50dc22c59  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index a441f7a10a..1e8b9b7c25 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.7.7
+CCACHE_VERSION = 3.7.8
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
