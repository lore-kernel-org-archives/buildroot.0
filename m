From: Dick Olsson <hi@senzilla.io>
Date: Tue, 27 Apr 2021 22:42:15 +0000
Subject: [Buildroot] [PATCH 02/10] package/execline: bump to version 2.8.0.1
Message-ID: <nCIzhiSFyX5cF0UYNBTr0Y9UIhpJxpvnvumkTYYzc@cp4-web-028.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://www.mail-archive.com/skaware at list.skarnet.org/msg01579.html

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 35ebc443b9..706b131afd 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  e7744b4a400eda68b83dcfb1bce65e454606279882d83d8230ddf8afda25766d  execline-2.8.0.0.tar.gz
+sha256  a373f497d2335905d750e2f3be2ba47a028c11c4a7d5595dca9965c161e53aed  execline-2.8.0.1.tar.gz
 sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 0ab5a03f2e..89265a10ed 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.8.0.0
+EXECLINE_VERSION = 2.8.0.1
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
-- 
2.30.2
