From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 21:35:11 +0200
Subject: [Buildroot] [git commit] Update for 2020.02.6
Message-ID: <20200905192708.8E2ED88186@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=721fdb0239d2f6c2d28ab927ce98917c83bb280f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b120226e0ef58e2665bfefd21bdd31a9adf1acb6)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/CHANGES b/CHANGES
index fc51a0d0c9..715bbaa79f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -393,6 +393,22 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
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
