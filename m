From: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
Date: Tue, 16 Jul 2019 13:58:30 -0400
Subject: [Buildroot] [PATCH] package/python-idna: select PYTHON3_UNICODEDATA
Message-ID: <20190716175830.604552-1-alex_y_xu@yahoo.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
---
 package/python-idna/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-idna/Config.in b/package/python-idna/Config.in
index 1fd56ceaf6..c247fa89d0 100644
--- a/package/python-idna/Config.in
+++ b/package/python-idna/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_IDNA
 	bool "python-idna"
+        select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	help
 	  A library to support the Internationalised Domain Names in
 	  Applications (IDNA) protocol as specified in RFC 5891. This
-- 
2.22.0
