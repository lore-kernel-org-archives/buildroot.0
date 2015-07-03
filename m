From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri,  3 Jul 2015 15:11:21 +0200
Subject: [Buildroot] [PATCH 2/7] Add rule to build host-libaio
In-Reply-To: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1435929086-21205-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1435929086-21205-3-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
---
 package/libaio/libaio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 53ad7eb..55e2cc7 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -24,3 +24,4 @@ define LIBAIO_INSTALL_TARGET_CMDS
 endef
 
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
1.9.1
