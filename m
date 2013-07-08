From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Jul 2013 09:34:22 -0300
Subject: [Buildroot] [PATCH] website: remove dead udhcp link
Message-ID: <1373286862-16765-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The udhcp.busybox.net site is gone, it's now pointing to bugzilla.
udhcp has been a part of busybox for some time now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 docs/header.html | 1 -
 1 file changed, 1 deletion(-)

diff --git a/docs/header.html b/docs/header.html
index a7160cd..12716d0 100644
--- a/docs/header.html
+++ b/docs/header.html
@@ -61,7 +61,6 @@
     <br><a href="http://busybox.net/">BusyBox</a>
     <br><a href="http://uclibc.org/">uClibc.org</a>
     <br><a href="http://cxx.uclibc.org/">uClibc++</a>
-    <br><a href="http://udhcp.busybox.net/">udhcp</a>
     <br><a href="http://www.scratchbox.org/">Scratchbox</a>
     <br><a href="http://openembedded.org/">OpenEmbedded</a>
     <br><a href="http://www.ucdot.org/">uCdot</a>
-- 
1.8.1.5
