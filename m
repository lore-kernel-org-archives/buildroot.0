From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 21 Jun 2016 09:10:38 +0200
Subject: [Buildroot] [PATCH] python-pytablewriter: place package/Config.in
	entry into alphabetical order
Message-ID: <1466493038-18172-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index ce71afb..171f4ad 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -736,6 +736,7 @@ menu "External python modules"
 	source "package/python-pysnmp-apps/Config.in"
 	source "package/python-pysnmp-mibs/Config.in"
 	source "package/python-pysocks/Config.in"
+	source "package/python-pytablewriter/Config.in"
 	source "package/python-pytrie/Config.in"
 	source "package/python-pytz/Config.in"
 	source "package/python-pyudev/Config.in"
@@ -758,7 +759,6 @@ menu "External python modules"
 	source "package/python-six/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-spidev/Config.in"
-	source "package/python-pytablewriter/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-treq/Config.in"
-- 
2.8.1
