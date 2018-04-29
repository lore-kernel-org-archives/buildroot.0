From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Apr 2018 14:43:21 +0200
Subject: [Buildroot] [PATCH 1/1] libdnet: add hash for license file
Message-ID: <20180429124321.23970-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libdnet/libdnet.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
index ee418723d9..d2e820270f 100644
--- a/package/libdnet/libdnet.hash
+++ b/package/libdnet/libdnet.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  0eb78415c8f2564c2f1e8ad36e98473348d9c94852f796a226360c716cc7ca53  libdnet-1.11.tar.gz
+sha256  1e94df12cb3701fa64e07eeb60284bb16a3544815d5a39860dacff7b86610584  LICENSE
-- 
2.14.1
