From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 11 Dec 2015 14:57:58 +0100
Subject: [Buildroot] [PATCH 2/3] package/boost: fix space tabs
In-Reply-To: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1449842279-22712-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index cffaf6e..97d0802 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -75,8 +75,8 @@ config BR2_PACKAGE_BOOST_CONTEXT
 			|| BR2_powerpc || BR2_x86_64)
 
 config BR2_PACKAGE_BOOST_COROUTINE
-        bool "boost-coroutine"
-        depends on BR2_PACKAGE_BOOST_CONTEXT
+	bool "boost-coroutine"
+	depends on BR2_PACKAGE_BOOST_CONTEXT
 
 config BR2_PACKAGE_BOOST_DATE_TIME
 	bool "boost-date_time"
-- 
2.6.4
