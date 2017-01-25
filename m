From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jan 2017 09:50:33 +0100
Subject: [Buildroot] [git commit] Update for 2016.11.2
Message-ID: <20170125085127.A153E81F15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8847039f64a790298163de7769350bae292af37a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit b8e588e623868d6ab239786b4cf486e1defc9c1c)
---
 CHANGES | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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
