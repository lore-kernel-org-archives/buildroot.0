From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Mon, 13 Jul 2009 20:59:51 -0400
Subject: [Buildroot] [PATCH] .gitignore: add backup files
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901A692C4@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add *.orig and *~ backup files to gitignore.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>

---

diff --git a/.gitignore b/.gitignore
index e7117d3..93b53bb 100644
--- a/.gitignore
+++ b/.gitignore
@@ -9,3 +9,5 @@
 /.config
 *.depend
 *.o
+*.orig
+*~ 
