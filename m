From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 30 May 2017 19:01:24 +0200
Subject: [Buildroot] [PATCH 2/6] exim: fix help text format
In-Reply-To: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
References: <1496163688-20870-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1496163688-20870-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Warning reported by check-package.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/exim/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exim/Config.in b/package/exim/Config.in
index 230ac86f96bd..aa50a86736d8 100644
--- a/package/exim/Config.in
+++ b/package/exim/Config.in
@@ -8,8 +8,9 @@ config BR2_PACKAGE_EXIM
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_BERKELEYDB
 	help
-	  Exim is a message transfer agent (MTA) developed at the University of
-	  Cambridge for use on Unix systems connected to the Internet.
+	  Exim is a message transfer agent (MTA) developed at the
+	  University of Cambridge for use on Unix systems connected to
+	  the Internet.
 
 	  http://www.exim.org/
 
-- 
2.7.4
