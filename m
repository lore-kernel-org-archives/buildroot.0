From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Oct 2015 10:46:27 -0300
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.12
Message-ID: <1445348787-2619-1-git-send-email-gustavo@zacarias.com.ar>
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
index 4872f94..b136599 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	bb9e6da51b7b12641f5d1abb39705c6c6c1b2fbd20002362948aa736a0aa353f  musl-1.1.11.tar.gz
+sha256	720b83c7e276b4b679c0bffe9509340d5f81fd601508e607e708177df0d31c0e  musl-1.1.12.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 2f43aab..6fdcc73 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.11
+MUSL_VERSION = 1.1.12
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.4.10
