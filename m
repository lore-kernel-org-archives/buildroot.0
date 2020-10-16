From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Oct 2020 08:41:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version 2020-09-R4
Message-ID: <20201016064102.1980387-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.kismetwireless.net/release/kismet-2020-09-R4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/kismet.hash | 2 +-
 package/kismet/kismet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 81c8cfb98b..c55e31ef96 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6c935a5ee28fe6c5376d6270a2fc484b26a65e63184506724427b2aeff674ab7  kismet-2020-09-R3.tar.xz
+sha256  79c9c343cc055523ec1c8607bf63f26bb826d8ffaccc1e6e033c945c8ada664d  kismet-2020-09-R4.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 723ce9c02b..853dabf106 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2020-09-R3
+KISMET_VERSION = 2020-09-R4
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
-- 
2.28.0
