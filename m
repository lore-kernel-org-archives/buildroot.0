From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 17 Nov 2012 13:42:28 -0300
Subject: [Buildroot] [PATCH 2/2] hiawatha: bump to version 8.6
In-Reply-To: <1353170548-13069-1-git-send-email-gustavo@zacarias.com.ar>
References: <1353170548-13069-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1353170548-13069-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/hiawatha/hiawatha.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 79546e3..bd9da43 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,5 +1,5 @@
-HIAWATHA_VERSION = 8.5
-HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
+HIAWATHA_VERSION = 8.6
+HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_LICENSE = GPLv2
 HIAWATHA_LICENSE_FILES = LICENSE
 
-- 
1.7.8.6
