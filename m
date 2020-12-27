From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 27 Dec 2020 19:31:44 +0100
Subject: [Buildroot] [PATCH 1/2] package/pcre2: remove empty line from
 Config.in
Message-ID: <20201227183145.1965023-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pcre2/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pcre2/Config.in b/package/pcre2/Config.in
index f35877f376..f06f1914f3 100644
--- a/package/pcre2/Config.in
+++ b/package/pcre2/Config.in
@@ -1,4 +1,3 @@
-
 config BR2_PACKAGE_PCRE2
 	bool "pcre2"
 	help
-- 
2.29.2
