From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 14:33:52 +0200
Subject: [Buildroot] [PATCH 1/1] libdaemon: add hash for license file
Message-ID: <20180429123352.20959-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdaemon/libdaemon.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdaemon/libdaemon.hash b/package/libdaemon/libdaemon.hash
index 8dbbb5a358..b510321828 100644
--- a/package/libdaemon/libdaemon.hash
+++ b/package/libdaemon/libdaemon.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 fd23eb5f6f986dcc7e708307355ba3289abe03cc381fc47a80bca4a50aa6b834 libdaemon-0.14.tar.gz
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861 LICENSE
-- 
2.14.1
