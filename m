From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jan 2011 15:37:48 +0100
Subject: [Buildroot] [PATCH 4/6] Use <code> instead of <pre> to improve
	formatting
In-Reply-To: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
References: <cover.1296398261.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a1579985e5305ea4d7f4c66ebd1b34a606c71041.1296398261.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/buildroot.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 1b8da2a..e815ee9 100644
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
1.7.0.4
