From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 16 Mar 2017 17:36:54 +0100
Subject: [Buildroot] [PATCH] dado: bump to version 1.8.0
Message-ID: <20170316163654.11419-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/dado/dado.hash | 2 +-
 package/dado/dado.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dado/dado.hash b/package/dado/dado.hash
index 3f17f08..984ef3f 100644
--- a/package/dado/dado.hash
+++ b/package/dado/dado.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	b7a68583c36643ad9040937d7e2b99230af7da83c7cbd13c9923881f1eb7490f  dado-1.6.0-1.src.rock
+sha256	dea331051c92ef2fbb22025a4f02e84e63d63148a66589401404877727f59941  dado-1.8.0-1.src.rock
diff --git a/package/dado/dado.mk b/package/dado/dado.mk
index a09dd6d..7ae4edf 100644
--- a/package/dado/dado.mk
+++ b/package/dado/dado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DADO_VERSION = 1.6.0-1
+DADO_VERSION = 1.8.0-1
 DADO_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
2.9.3
