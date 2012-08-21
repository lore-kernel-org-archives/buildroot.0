From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Tue, 21 Aug 2012 16:48:28 +0300
Subject: [Buildroot] [PATCH] python: firefox host-python dependency needs
	--enable-unicodedata
Message-ID: <1345556908-9189-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
---
 package/python/python.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..6a79584 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -22,7 +22,7 @@ HOST_PYTHON_CONF_OPT += 	\
 	--disable-curses	\
 	--disable-codecs-cjk	\
 	--disable-nis		\
-	--disable-unicodedata	\
+	--enable-unicodedata	\
 	--disable-dbm		\
 	--disable-gdbm		\
 	--disable-bsddb		\
-- 
1.7.7.6
