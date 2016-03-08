From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 23:59:46 +0100
Subject: [Buildroot] [git commit] ubus: indentation cleanup
Message-ID: <20160308225957.91236802CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e710454aad80f2bbbd7361d8b15b098df456abd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ubus/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index 391fc8d..c14f6a8 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -1,6 +1,6 @@
 comment "ubus needs a toolchain w/ dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-        depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS
 
 config BR2_PACKAGE_UBUS
 	bool "ubus"
