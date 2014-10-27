From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 15:18:59 -0300
Subject: [Buildroot] [PATCH 6/8] system/skeleton: drop adm user from shadow
In-Reply-To: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414433941-5778-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It has no counterpart in passwd so it's basically a NOP.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/etc/shadow | 1 -
 1 file changed, 1 deletion(-)

diff --git a/system/skeleton/etc/shadow b/system/skeleton/etc/shadow
index d5734d7..69ab451 100644
--- a/system/skeleton/etc/shadow
+++ b/system/skeleton/etc/shadow
@@ -1,7 +1,6 @@
 root::10933:0:99999:7:::
 bin:*:10933:0:99999:7:::
 daemon:*:10933:0:99999:7:::
-adm:*:10933:0:99999:7:::
 lp:*:10933:0:99999:7:::
 sync:*:10933:0:99999:7:::
 shutdown:*:10933:0:99999:7:::
-- 
2.0.4
