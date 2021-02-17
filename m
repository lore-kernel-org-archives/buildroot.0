From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 21:00:07 +0100
Subject: [Buildroot] [git commit] Update for 2020.02.11
Message-ID: <20210217194413.C111E86148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=947e9219bce1473db6e99b010f2254f1a64edede
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 08e03785d3812c085c438a6040ccedc3e9f5809d)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/CHANGES b/CHANGES
index 6804131d50..b2ac108bd5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -879,6 +879,27 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
+2020.02.11, released February 17, 2021
+
+	Important / security related fixes.
+
+	meson: Fix ccache detection handling when per-package builds
+	are used.
+
+	Fakeroot: Fix compatibility issue with glibc 2.33
+
+	Updated/fixed packages: atftp, busybox, cereal, connman,
+	dhcpcd, dnsmasq, docker-cli, docker-engine, fakeroot,
+	intel-mediadriver, intel-microcode, jasper,
+	kodi-inputstream-adaptive, libbsd, libopenssl, linux-headers,
+	mosquitto, orc, php, postgresql, privoxy, pugixml,
+	python-bottle, python-django, python3, rauc, sox, subversion,
+	tzdata, wireguard-linux-compat, wpa_supplicant, xenomai, xterm
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13506: BR2_PACKAGE_DHCPCD missing directory creation
+
 2020.02.10, released January 31st, 2021
 
 	Important / security related fixes.
