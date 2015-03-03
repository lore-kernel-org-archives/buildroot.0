From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 16:10:43 -0300
Subject: [Buildroot] [PATCH 2/2] uclibc: add hash for uclibc-ng
In-Reply-To: <1425409843-13569-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425409843-13569-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425409843-13569-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 0fba41a..ad0ca62 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,6 @@
 # Locally calculated after checking pgp signature (vanilla)
 # Locally calculated (ARC)
+# http://downloads.uclibc-ng.org/releases/1.0.0/uClibc-ng-1.0.0.tar.xz.sha256 (uClibc-ng)
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
+sha256	56258bfa62e3a70c5d29480ccd8f8d94fc2740233a493d8c66b6e7a37830b9d1	uClibc-ng-1.0.0.tar.xz
-- 
2.0.5
