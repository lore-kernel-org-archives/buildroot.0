From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Apr 2018 13:57:09 +0200
Subject: [Buildroot] [PATCH 1/1] libglu: add hash for license file
Message-ID: <20180430115709.24662-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglu/libglu.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
index 784386e0ca..468787864e 100644
--- a/package/libglu/libglu.hash
+++ b/package/libglu/libglu.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  3d19cca9b26ec4048dd22e3d294acd43e080a3205a29ff47765bd514571ea8f9  glu-9.0.0.tar.gz
+sha256  84187ce0fd0153769675cb7f3301583eb27393f66b57c5604999a1d805a9184c  include/GL/glu.h
-- 
2.14.1
