From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Feb 2014 10:19:40 +0100
Subject: [Buildroot] [PATCH] docs/web: give a little bit more exposure to
	our Google+ page
Message-ID: <1392369580-3975-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a small icon that links the Buildroot home page to our Google+
page.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/header.html | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/header.html b/docs/header.html
index b987d85..625c079 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -57,7 +57,9 @@
     <br><a href="http://autobuild.buildroot.org">Autobuilder</a>
     <br><a href="http://patchwork.buildroot.org">Patchwork</a>
     <br><a href="/sponsors.html">Sponsors</a>
-
+    <br><a href="https://plus.google.com/100084591154899263420?prsrc=3" rel="publisher" target="_top" style="text-decoration:none;">
+      <img src="https://ssl.gstatic.com/images/icons/gplus-32.png" alt="Google+" style="border:0;width:32px;height:32px;"/>
+    </a>
 </td>
 
 
-- 
1.8.3.2
