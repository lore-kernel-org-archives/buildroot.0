From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 22:34:11 +0200
Subject: [Buildroot] [git commit master 1/1] docs/buildroot.html: minor
	tweaks
Message-ID: <20100927203433.A1F6D8B6D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=677ae6f6a5554d9ce1162bb472c489df41ca2c8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- We have gconfig as well nowadays
- Variables like BUILDROOT_DL_DIR can also be set permanently in the
  environment, and not just passed to make every time.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/buildroot.html |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 6d4f17c..edb75b1 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -260,7 +260,7 @@ or
 
     <p>If you intend to do an offline build and just want to download
     all sources that you previously selected in the configurator
-    (<i>menuconfig</i> or <i>xconfig</i>), then issue:</p>
+    (<i>menuconfig</i>, <i>xconfig</i> or <i>gconfig</i>), then issue:</p>
 <pre>
  $ make source
 </pre>
@@ -291,7 +291,7 @@ or
     Environment variables</h3>
 
     <p>Buildroot also honors some environment variables when they are passed
-    to <code>make</code>:</p>
+    to <code>make</code> or set in the environment:</p>
     <ul>
     <li><code>HOSTCXX</code>, the host C++ compiler to use</li>
     <li><code>HOSTCC</code>, the host C compiler to use</li>
-- 
1.7.1
