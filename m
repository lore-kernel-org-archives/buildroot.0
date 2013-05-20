From: Assaf Inbal <shmuelzon@gmail.com>
Date: Mon, 20 May 2013 15:56:34 +0300
Subject: [Buildroot] [PATCH 02/12] luasocket: Update source location
In-Reply-To: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
References: <1369054604-26139-1-git-send-email-shmuelzon@gmail.com>
Message-ID: <1369054604-26139-2-git-send-email-shmuelzon@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Assaf Inbal <shmuelzon@gmail.com>
---
 package/luasocket/luasocket.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luasocket/luasocket.mk b/package/luasocket/luasocket.mk
index 45fb9a3..80cbe24 100644
--- a/package/luasocket/luasocket.mk
+++ b/package/luasocket/luasocket.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 LUASOCKET_VERSION = 2.0.2
-LUASOCKET_SITE = http://luaforge.net/frs/download.php/2664
+LUASOCKET_SITE = http://github.com/downloads/keplerproject/luaosocket
 LUASOCKET_DEPENDENCIES = lua
 LUASOCKET_LICENSE = MIT
 LUASOCKET_LICENSE_FILES = LICENSE
-- 
1.8.1.2
