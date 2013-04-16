From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 15 Apr 2013 21:47:59 -0300
Subject: [Buildroot] [PATCH 4/4] hiawatha: bump to version 9.1
In-Reply-To: <1366073279-28652-1-git-send-email-gustavo@zacarias.com.ar>
References: <1366073279-28652-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1366073279-28652-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 9.1 which includes mitigations against BEAST and the RC4
vuln.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/hiawatha.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 1cd700a..3348d53 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,4 +1,4 @@
-HIAWATHA_VERSION = 9.0
+HIAWATHA_VERSION = 9.1
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_LICENSE = GPLv2
 HIAWATHA_LICENSE_FILES = LICENSE
-- 
1.8.1.5
