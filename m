From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 21:10:33 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Update for 2020.02.6
Message-ID: <20200905190322.6606F88128@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b120226e0ef58e2665bfefd21bdd31a9adf1acb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 16 ++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 54f8e403ed..370becaf20 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,19 @@
+2020.02.6, released September 5th, 2020
+
+	Important / security related fixes.
+
+	Fix a 2020.02.5 build regression in busybox when systemd (and
+	not less) are enabled because of missing infrastructure.
+
+	Updated/fixed packages: alsa-utils, avahi, busybox, cups,
+	docker-cli, graphite2, imagemagick, libeXosip2, mbedtls,
+	nvidia-driver, paho-mqtt-c, python-django, systemd, uclibc,
+	usb_modeswitch, wolfssl
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12911: usb_modeswitch installation race condition
+
 2020.02.5, released August 29th, 2020
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 53608d4b99..1778ae8671 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2020.02.5
+export BR2_VERSION := 2020.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1598727000
+BR2_VERSION_EPOCH = 1599333000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
