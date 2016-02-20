From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:39:17 +0100
Subject: [Buildroot] [git commit branch/next] package: fix alphabetic
	ordering in Config.in
Message-ID: <20160220143944.78DFC7FDF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b965272379cc825d64da795db564edadbf5720c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The python-crossbar package was not added at the right location, so
this commit fixes the alphabetic ordering.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index 4513e4f..75f8132 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -636,8 +636,8 @@ menu "External python modules"
 	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-crc16/Config.in"
-	source "package/python-cryptography/Config.in"
 	source "package/python-crossbar/Config.in"
+	source "package/python-cryptography/Config.in"
 	source "package/python-cssselect/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
