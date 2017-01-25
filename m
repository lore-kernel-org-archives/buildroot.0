From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 09:27:44 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] Update for 2016.11.2
Message-ID: <20170125083000.DC77481EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8e588e623868d6ab239786b4cf486e1defc9c1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 15 +++++++++++++++
 Makefile |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 8dee2f5..ec749a1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,18 @@
+2016.11.2, Released January 25th, 2017
+
+	Important / security related fixes.
+
+	A fix for BR2_EXTERNAL trees referenced using relative paths,
+	which broke in 2016.11.
+
+	Updated/fixed packages: bind, docker-engine, gd, gnutls, go,
+	imagemagick, irssi, libpng, libvncserver, musl, opus, php,
+	php-imagick, rabbitmq-server, runc, wireshark,
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9576: External tree with BR 2016.11 does not work anymore
+
 2016.11.1, Released December 29th, 2016
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 97f1bdd..1d119ae 100644
--- a/Makefile
+++ b/Makefile
@@ -83,7 +83,7 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2016.11.1
+export BR2_VERSION := 2016.11.2
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
