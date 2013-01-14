From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Jan 2013 16:33:33 +0100
Subject: [Buildroot] [git commit] docs/manual: mention the Eclipse
	integration
Message-ID: <20130114153605.B211A9A0E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d17d1708560ded94587f77e5015d1f966eecae18
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/eclipse-integration.txt |   30 ++++++++++++++++++++++++++++++
 docs/manual/working-with.txt        |    2 ++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/docs/manual/eclipse-integration.txt b/docs/manual/eclipse-integration.txt
new file mode 100644
index 0000000..3d8179f
--- /dev/null
+++ b/docs/manual/eclipse-integration.txt
@@ -0,0 +1,30 @@
+// -*- mode:doc; -*-
+
+Integration with Eclipse
+------------------------
+
+While a part of the embedded Linux developers like classical text
+editors like Vim or Emacs, and command-line based interfaces, a number
+of other embedded Linux developers like richer graphical interfaces to
+do their development work. Eclipse being one of the most popular
+Integrated Development Environment, Buildroot integrates with Eclipse
+in order to ease the development work of Eclipse users.
+
+Our integration with Eclipse simplifies the compilation, remote
+execution and remote debugging of applications and libraries that are
+built on top of a Buildroot system. It does not integrate the
+Buildroot configuration and build processes themselves with
+Eclipse. Therefore, the typical usage model of our Eclipse integration
+would be:
+
+* Configure your Buildroot system with +make menuconfig+, +make
+  xconfig+ or any other configuration interface provided with
+  Buildroot.
+* Build your Buildroot system by running +make+.
+* Start Eclipse to develop, execute and debug your own custom
+  applications and libraries, that will rely on the libraries built
+  and installed by Buildroot.
+
+The Buildroot Eclipse integration installation process and usage is
+described in detail at
+https://github.com/mbats/eclipse-buildroot-bundle/wiki.
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index b62bacd..fb6bc40 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -14,6 +14,8 @@ include::customize.txt[]
 
 include::common-usage.txt[]
 
+include::eclipse-integration.txt[]
+
 Hacking Buildroot
 -----------------
 
