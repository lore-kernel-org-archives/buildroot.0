From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 18:26:00 +0100
Subject: [Buildroot] [git commit] package/ccache: bump to version 3.7.7
Message-ID: <20200109171647.9467683493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b54d799cf25a203a814b9dd35b9f15de7c60179
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Licese was change with a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ccache/ccache.hash | 4 ++--
 package/ccache/ccache.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index 5bbc8edb11..83c172feae 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,4 +1,4 @@
 # sha256 computed locally
-sha256  e51c611a3da865754cb0ff1ddd95bd7a6acac603576c0bd39583f8cc30af28d2  ccache-3.7.5.tar.xz
+sha256  b7c1d6d6fe42f18e424de92746af863e0bc85794da3d69e44300840c478c98cd  ccache-3.7.7.tar.xz
 sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
-sha256  d36644184e3fd668d10fbb292b58da3f2fe473d5109534a17e32339e0b372e99  LICENSE.adoc
+sha256  4f63223bcdee822d55a6768cc8399ffe06401d7a03cfe79e1dc305f50dc22c59  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 51fbf202f3..a441f7a10a 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.7.5
+CCACHE_VERSION = 3.7.7
 CCACHE_SITE = https://github.com/ccache/ccache/releases/download/v$(CCACHE_VERSION)
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
