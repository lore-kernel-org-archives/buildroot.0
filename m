From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 May 2018 21:17:36 +0200
Subject: [Buildroot] [PATCH 1/1] libmad: add hash for license file
Message-ID: <20180504191736.27510-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmad/libmad.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmad/libmad.hash b/package/libmad/libmad.hash
index 173399f7ff..8b7859395f 100644
--- a/package/libmad/libmad.hash
+++ b/package/libmad/libmad.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690  libmad-0.15.1b.tar.gz
 sha256  0e21f2c6b19337d0b237dacc04f7b90a56be7f359f4c9a2ee0b202d9af0cfa69  frame_length.diff
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.14.1
