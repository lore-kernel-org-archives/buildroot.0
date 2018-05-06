From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 May 2018 11:37:09 +0200
Subject: [Buildroot] [PATCH 1/1] libmhash: add hash for license file
Message-ID: <20180506093709.25014-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmhash/libmhash.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmhash/libmhash.hash b/package/libmhash/libmhash.hash
index 5ae5686652..06c1fe4897 100644
--- a/package/libmhash/libmhash.hash
+++ b/package/libmhash/libmhash.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  56521c52a9033779154432d0ae47ad7198914785265e1f570cee21ab248dfef0  mhash-0.9.9.9.tar.bz2
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
-- 
2.14.1
