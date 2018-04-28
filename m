From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Apr 2018 16:29:41 +0200
Subject: [Buildroot] [PATCH 1/1] libcdaudio: add hash for license file
Message-ID: <20180428142941.28299-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcdaudio/libcdaudio.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcdaudio/libcdaudio.hash b/package/libcdaudio/libcdaudio.hash
index f8e1112c59..67df7c5e41 100644
--- a/package/libcdaudio/libcdaudio.hash
+++ b/package/libcdaudio/libcdaudio.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5fdaf9af5ac4f75c0215d000b82b128fd054a582f81cc4f039a1e7fe69335ebb  libcdaudio-0.99.12p2.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
-- 
2.14.1
