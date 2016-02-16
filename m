From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 16 Feb 2016 10:17:24 -0300
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.13
Message-ID: <1455628644-14211-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musl/musl.hash | 2 +-
 package/musl/musl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index b136599..0970ad6 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	720b83c7e276b4b679c0bffe9509340d5f81fd601508e607e708177df0d31c0e  musl-1.1.12.tar.gz
+sha256	bbacdc64f557d0c4857f7d2daf592c32c29aec1babbb94fcf01a2e05bed15013  musl-1.1.13.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 2cc6699..d68e769 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.12
+MUSL_VERSION = 1.1.13
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.4.10
