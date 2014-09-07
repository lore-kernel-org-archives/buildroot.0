From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  7 Sep 2014 12:50:51 -0300
Subject: [Buildroot] [PATCH 1/2] efl: bump to version 1.7.10
Message-ID: <1410105052-15504-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/efl/efl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 1de68cf..aa6630c 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -1,3 +1,3 @@
-EFL_VERSION = 1.7.7
+EFL_VERSION = 1.7.10
 
 include $(sort $(wildcard package/efl/*/*.mk))
-- 
1.8.5.5
