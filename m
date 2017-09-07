From: Romain Naour <romain.naour@smile.fr>
Date: Thu,  7 Sep 2017 23:43:55 +0200
Subject: [Buildroot] [PATCH] package/openpowerlink: bump to v2.6.1
Message-ID: <20170907214355.16856-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

http://openpowerlink.sourceforge.net/web/openPOWERLINK/Download/openPOWERLINK%202.6.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/openpowerlink/openpowerlink.hash | 8 ++++----
 package/openpowerlink/openpowerlink.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openpowerlink/openpowerlink.hash b/package/openpowerlink/openpowerlink.hash
index 2a3c1f0..5c95431 100644
--- a/package/openpowerlink/openpowerlink.hash
+++ b/package/openpowerlink/openpowerlink.hash
@@ -1,5 +1,5 @@
-# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.6.0/
-md5	afe5c1ed2d329d5b3784eb6999ab9d17	openPOWERLINK_V2.6.0.tar.gz
-sha1	c8b317f118f69e416bc812e93a97e073d62a29d9	openPOWERLINK_V2.6.0.tar.gz
+# From http://sourceforge.net/projects/openpowerlink/files/openPOWERLINK/V2.6.1/
+md5	9f53ccc72356cf421ecd089f91421393	openPOWERLINK_V2.6.1.tar.gz
+sha1	dfb97845937e8d1de3e554c17b951a115352faa6	openPOWERLINK_V2.6.1.tar.gz
 # sha256 locally computed
-sha256	a53dd279a5341fc350e4be94949d4642579c4c4eb27706f1b36d41136b400ff8	openPOWERLINK_V2.6.0.tar.gz
+sha256	89a8b321938f965aa03610f40c38d2f17242aab1b0b5f24b93c4542f2f3fbd5c	openPOWERLINK_V2.6.1.tar.gz
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 660dd60..c9ca4cc 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENPOWERLINK_VERSION = V2.6.0
+OPENPOWERLINK_VERSION = V2.6.1
 OPENPOWERLINK_SITE = http://downloads.sourceforge.net/project/openpowerlink/openPOWERLINK/$(OPENPOWERLINK_VERSION)
 OPENPOWERLINK_SOURCE = openPOWERLINK_$(OPENPOWERLINK_VERSION).tar.gz
 OPENPOWERLINK_LICENSE = BSD-2-Clause, GPL-2.0
-- 
2.9.5
