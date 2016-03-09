From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 Mar 2016 06:41:53 -0300
Subject: [Buildroot] [PATCH] zeromq: drop required openpgm library comment
Message-ID: <1457516513-7501-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's obvious, buildroot has it and it's selected/depended upon.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zeromq/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/Config.in b/package/zeromq/Config.in
index c623064..efb9239 100644
--- a/package/zeromq/Config.in
+++ b/package/zeromq/Config.in
@@ -45,6 +45,6 @@ config BR2_PACKAGE_ZEROMQ_PGM
 	help
 	  Add support for Pragmatic General Multicast protocol (RFC 3208)
 	  implemented either over raw IP packets or UDP datagrams
-	  (encapsulated PGM). This requires OpenPGM library.
+	  (encapsulated PGM).
 
 endif
-- 
2.4.10
