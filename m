From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 20:13:44 +0100
Subject: [Buildroot] [git commit master 1/1] Use <code> instead of <pre> to
	improve formatting
Message-ID: <20110130191406.4FA818E21F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=07cb06962c5a9326bf30713ee0a6ee2fd6a67323
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 1ec707d..f1721ea 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -187,8 +187,8 @@
     <p>You <b>should never</b> use <code>make -jN</code> with
     Buildroot: it does not support <i>top-level parallel
     make</i>. Instead, use the <code>BR2_JLEVEL</code> option to tell
-    Buildroot to run each package compilation with <pre>make
-    -jN</pre>.</p>
+    Buildroot to run each package compilation with <code>make
+    -jN</code>.</p>
 
     <p>This command will generally perform the following steps:</p>
     <ul>
-- 
1.7.3.4
