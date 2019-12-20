From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Fri, 20 Dec 2019 14:27:53 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/libyang; bump to version 1.0.109
In-Reply-To: <20191220132756.32395-1-heiko.thiery@gmail.com>
References: <20191220132756.32395-1-heiko.thiery@gmail.com>
Message-ID: <20191220132756.32395-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 package/libyang/libyang.hash | 2 +-
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index 442eb7bc4a..c5426042bb 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,2 +1,2 @@
-sha256 411f0c675b0858f8deabc0545e33fbd791ff7c7a5b7d2c27e347e3973d5b8ae4  libyang-1.0-r4.tar.gz
+sha256 1686a381a8cce775102e60c8eb93f7ba64c6d4ae10591fc05d9f969a07815f60  libyang-1.0.109.tar.gz
 sha256 f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index cfec08cd16..648ffeb6a3 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0-r4
+LIBYANG_VERSION = 1.0.109
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1
