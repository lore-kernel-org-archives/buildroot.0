From: Michael Vetter <jubalh@iodoru.org>
Date: Tue,  6 Oct 2020 09:27:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump to version 2.0.22
In-Reply-To: <20201006072749.11275-1-jubalh@iodoru.org>
References: <20201006072749.11275-1-jubalh@iodoru.org>
Message-ID: <20201006072749.11275-2-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index df8ac8c9c7..bb660e3c5d 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 2482def06dfaa33b8d93cbe992a29723309f3c2b6e75674423a52fc82be10418  jasper-2.0.21.tar.gz
+sha256 afc4166bff29b8a0dc46ed5e8d6a208d7976fccfd0b1146e3400c8b2948794a2  jasper-2.0.21.tar.gz
 sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 1351efa563..ab7cb933bc 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.21
+JASPER_VERSION = 2.0.22
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.26.2
