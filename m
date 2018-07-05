From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Jul 2018 10:35:23 +0300
Subject: [Buildroot] [PATCH] DEVELOPERS: fix alphabetic order
Message-ID: <a175f85858a4971691df0179a1598a67ecf6300f.1530776123.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move Pierre's entry to its correct place.

Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 DEVELOPERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1fa0020dbbea..cba1344d1dc7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1609,6 +1609,9 @@ F:	package/lttng-tools/
 F:	package/python-ipython/
 F:	package/liburcu/
 
+N:	Pierre Ducroquet <pinaraf@pinaraf.info>
+F:	package/kf5/
+
 N:	Pierre Floury <pierre.floury@gmail.com>
 F:	package/trace-cmd/
 
@@ -2143,6 +2146,3 @@ F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
 F:	package/tinc/
-
-N:	Pierre Ducroquet <pinaraf@pinaraf.info>
-F:	package/kf5/
-- 
2.18.0
