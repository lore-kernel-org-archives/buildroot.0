From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 May 2017 09:48:12 +0200
Subject: [Buildroot] [PATCH/next 1/1] lxc: fix hash of patch
Message-ID: <1496044092-78363-1-git-send-email-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix hash of bc5b27d6f6d166d2a6df47982cbe36041ce6b73.patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lxc/lxc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 801759a..501f869 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256	0d8e34b302cfe4c40c6c9ae5097096aa5cc2c1dfceea3f0f22e3e16c4a4e8494	lxc-2.0.8.tar.gz
-sha256	c79443c5db7e7defd53992d120cad2bc8afc2ff363b1e84ec31bc2b95ec5ca44	bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
+sha256	16cf466db42a45bd579bdb66efbeb63764cd93d049f05a6d8a659846cab9b47f	bc5b27d6f6d166d2a6df47982cbe36041ce6b735.patch
-- 
2.5.0
