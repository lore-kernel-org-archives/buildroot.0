From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Feb 2021 09:58:23 +0100
Subject: [Buildroot] [PATCH/next 04/54] package/libcec: bump version to 6.0.2
In-Reply-To: <20210220085913.888324-1-bernd.kuhls@t-online.de>
References: <20210220085913.888324-1-bernd.kuhls@t-online.de>
Message-ID: <20210220085913.888324-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 36b6bad861..3e5a443057 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bcd92c376993a5721d346edcc09eb17289451f9156b1d1d113c9663c2046315a  libcec-4.0.7.tar.gz
+sha256  090696d7a4fb772d7acebbb06f91ab92e025531c7c91824046b9e4e71ecb3377  libcec-6.0.2.tar.gz
 sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  COPYING
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 7c37d05c7f..6591bc009a 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 4.0.7
+LIBCEC_VERSION = 6.0.2
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPL-2.0+
 LIBCEC_LICENSE_FILES = COPYING
-- 
2.29.2
