From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 14 Apr 2020 10:17:16 +0200
Subject: [Buildroot] [PATCH 2/3] package/libyang: bump to version 1.0.130
In-Reply-To: <20200414081717.4940-1-heiko.thiery@gmail.com>
References: <20200414081717.4940-1-heiko.thiery@gmail.com>
Message-ID: <20200414081717.4940-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Align hashes to the new spacing convention

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 5 +++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index c5426042bb..9e1f60492e 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,2 +1,3 @@
-sha256 1686a381a8cce775102e60c8eb93f7ba64c6d4ae10591fc05d9f969a07815f60  libyang-1.0.109.tar.gz
-sha256 f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
+# Locally calculated
+sha256  c9703079f10fbf7154882562322b4b01764bc7735345da555ca51201b02e536c  libyang-1.0.130.tar.gz
+sha256  f942fe693e03e4e3ff67a351c00dc8f468a042e0d7273b0aa6bc53060b568112  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index 648ffeb6a3..4e47c9f5fc 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 1.0.109
+LIBYANG_VERSION = 1.0.130
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.20.1
