From: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Date: Sun,  6 May 2018 11:57:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/Config.in: fix alphabetical order
Message-ID: <1525600641-4386-1-git-send-email-jerzy.m.grzegorek@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index b527769..85bb3ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -948,7 +948,6 @@ menu "External python modules"
 	source "package/python-tabledata/Config.in"
 	source "package/python-tempora/Config.in"
 	source "package/python-texttable/Config.in"
-	source "package/python-typepy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
@@ -958,6 +957,7 @@ menu "External python modules"
 	source "package/python-twisted/Config.in"
 	source "package/python-txaio/Config.in"
 	source "package/python-txtorcon/Config.in"
+	source "package/python-typepy/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-ujson/Config.in"
-- 
1.9.1
