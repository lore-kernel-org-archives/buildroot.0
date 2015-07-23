From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Jul 2015 14:18:35 +0300
Subject: [Buildroot] [PATCH 2/2] openipmi: add homepage URL
In-Reply-To: <b1e61f493d8b5e488f8e2dcdd9f2c43baf70959d.1437650315.git.baruch@tkos.co.il>
References: <b1e61f493d8b5e488f8e2dcdd9f2c43baf70959d.1437650315.git.baruch@tkos.co.il>
Message-ID: <631f2a97dc28ca839d84490467975232cf4c8c51.1437650315.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The homepage is now back online.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/openipmi/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openipmi/Config.in b/package/openipmi/Config.in
index 667efa74a863..da886578f835 100644
--- a/package/openipmi/Config.in
+++ b/package/openipmi/Config.in
@@ -11,6 +11,8 @@ config BR2_PACKAGE_OPENIPMI
 	  to interact with IPMI enabled devices. OpenIPMI also provides
 	  an IPMI BMC simulator.
 
+	  http://openipmi.sourceforge.net
+
 comment "openipmi needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.1.4
