From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 21 Nov 2011 17:06:46 -0500
Subject: [Buildroot] [PATCH] docs: Configuration path update
Message-ID: <1321913206-10645-1-git-send-email-twoerner@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Trevor Woerner <twoerner@gmail.com>

Update the procedure for modifying /etc/inittab's getty line with
the correct port and baud values to reflect their current names and
locations in the Buildroot configuration.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 docs/buildroot.html |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 2314d10..d5be127 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -1787,9 +1787,9 @@ Starting dropbear sshd: generating rsa key... generating dsa key... OK</pre>
     <p>then it means that your system is running, but didn't start a
     shell on the serial console. In order to have the system start a
     shell on your serial console, you have to go in the Buildroot
-    configuration, <code>Target options</code>, enable <code>Generic
-    serial port config</code>, and select the serial port and speed
-    you would like to use for the shell. This will automatically tune
+    configuration, <code>System configuration</code>, and modify
+    <code>Port to run a getty (login prompt) on</code> and
+    <code>Baudrate to use</code> as appropriate. This will automatically tune
     the <code>/etc/inittab</code> file of the generated system so that
     a shell starts on the correct serial port.</p>
 
-- 
1.7.6.233.gd79bc
