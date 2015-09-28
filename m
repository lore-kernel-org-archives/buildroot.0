From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 28 Sep 2015 23:27:22 +0200
Subject: [Buildroot] [PATCH 2/4] libssh/libssh.mk:remove an extra '#' sign
	in the header package name
In-Reply-To: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1443475644-5320-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libssh/libssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index ded5e8c..68438b9 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -1,6 +1,6 @@
 ################################################################################
 #
-## libssh
+# libssh
 #
 ################################################################################
 
-- 
1.9.1
