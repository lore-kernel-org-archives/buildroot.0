From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Feb 2014 13:40:50 +0100
Subject: [Buildroot] [git commit] docs/web: give a little bit more exposure
	to our Google+ page
Message-ID: <20140214124324.BBBFD9CA02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ea812ea481db6abdba9d703bd81d96e975f6eef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a small icon that links the Buildroot home page to our Google+
page.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/header.html |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

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
 
 
