From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 17:33:12 +0200
Subject: [Buildroot] [git commit] package/Config.in: fix alphabetical order
Message-ID: <20180506153533.5C5AC8B800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c80817360dc7ea3526a907be6b326a18a374fba2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index b613a1865c..a48abf9470 100644
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
