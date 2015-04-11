From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 Apr 2015 09:17:42 -0300
Subject: [Buildroot] [PATCH 14/14] toolchain-common: drop BR2_INET_IPV6
In-Reply-To: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428754662-27829-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428754662-27829-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's now unused so farewell.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-common.in | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index dfb7394..478315b 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -5,10 +5,6 @@
 # so put it here instead
 source "package/gdb/Config.in.host"
 
-config BR2_INET_IPV6
-	bool
-	default y
-
 config BR2_TOOLCHAIN_HAS_GCC_BUG_58595
 	bool
 
-- 
2.0.5
