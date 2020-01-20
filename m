From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 20 Jan 2020 10:12:53 +0100
Subject: [Buildroot] [PATCH] package/uvw: bump to version 2.3.1_libuv-v1.34
In-Reply-To: <20200120091254.30207-1-joerg.krause@embedded.rocks>
References: <20200120091254.30207-1-joerg.krause@embedded.rocks>
Message-ID: <20200120091254.30207-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The copyright year was updated in LICENSE, therefore the value of the
hash was updated, too.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/uvw/uvw.hash | 4 ++--
 package/uvw/uvw.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
index 0fd93d3924..c74db9b916 100644
--- a/package/uvw/uvw.hash
+++ b/package/uvw/uvw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e10b3ea2df202ef8de24b9922cc30f4de89f30ed4533a6ebfc9d979e7b7c66aa  uvw-2.3.0_libuv-v1.34.tar.gz
-sha256  ea786619b4d1b2ba0a188e923111122dfefea1d01c86e37f9e8c80bdbc3ea400  LICENSE
+sha256  578179ee76d010c5c9fb180a1b60e45e9f04968718d62c51ec0f71b43564bab9  uvw-2.3.1_libuv-v1.34.tar.gz
+sha256  755b2f245af22830c15b60c54469c0d92fbed42009b0d0074cec4b3959905757  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
index 46ee05bb08..71b23b2ac1 100644
--- a/package/uvw/uvw.mk
+++ b/package/uvw/uvw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UVW_VERSION = 2.3.0_libuv-v1.34
+UVW_VERSION = 2.3.1_libuv-v1.34
 UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
 UVW_INSTALL_STAGING = YES
 UVW_INSTALL_TARGET = NO
-- 
2.25.0
