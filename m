From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jun 2012 08:30:00 -0300
Subject: [Buildroot] [PATCH 4/5] sqlite: bump to version 3.7.13
In-Reply-To: <1340451001-7111-1-git-send-email-gustavo@zacarias.com.ar>
References: <1340451001-7111-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1340451001-7111-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 2c23582..62ea661 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3071201
+SQLITE_VERSION = 3071300
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
-- 
1.7.3.4
