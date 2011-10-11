From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:02:54 -0300
Subject: [Buildroot] [PATCH 3/5] portmap: use common syntax for RPC support
	needed comment
In-Reply-To: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318341776-19358-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318341776-19358-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/portmap/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index 1f22ab6..5914357 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -6,5 +6,5 @@ config BR2_PACKAGE_PORTMAP
 
 	  http://neil.brown.name/portmap/
 
-comment "portmap requires a toolchain with 'Enable RPC' selected"
+comment "portmap requires a toolchain with RPC support"
 	depends on !BR2_INET_RPC
-- 
1.7.3.4
