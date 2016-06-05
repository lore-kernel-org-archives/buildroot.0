From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Jun 2016 19:52:13 +0200
Subject: [Buildroot] [PATCH 20/28] package/sconeserver: bump version
In-Reply-To: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465149141-15774-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465149141-15774-20-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sconeserver/sconeserver.hash | 2 +-
 package/sconeserver/sconeserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/sconeserver.hash b/package/sconeserver/sconeserver.hash
index 2e1fe84..4503b9f 100644
--- a/package/sconeserver/sconeserver.hash
+++ b/package/sconeserver/sconeserver.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	442c29ae93f615b610983187023ba6c1a9ca69526cb07f69576efba1d29d9daf	sconeserver-c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd.tar.gz
+sha256 6bd76843df8e48519c67c72505412896b227d7b40ec0dee831c79ed414c85ff3 sconeserver-bbb384404575f8a3ef31c1ec41218b621b66ab27.tar.gz
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 592de22..0b0ed1a 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONESERVER_VERSION = c4b8e14f6e9e06cbff5b4195f69d6fce9391a1cd
+SCONESERVER_VERSION = bbb384404575f8a3ef31c1ec41218b621b66ab27
 SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
 SCONESERVER_LICENSE = GPLv2+
 SCONESERVER_LICENSE_FILES = COPYING
-- 
2.8.1
