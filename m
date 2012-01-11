From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Wed, 11 Jan 2012 18:09:23 +0100
Subject: [Buildroot] [PATCH 2/2] Update the CHANGES file to mention this new
	policy
In-Reply-To: <cover.1326301656.git.maxime.ripard@free-electrons.com>
References: <cover.1326301656.git.maxime.ripard@free-electrons.com>
Message-ID: <d9bcbeac65110789d393278b8984823864083c52.1326301656.git.maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 CHANGES |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 515e3db..5c1e9c9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,6 +10,9 @@
 
 	uClibc: remove 0.9.30, backport unshare() support.
 
+	Buildroot now calls the stop function of scripts in /etc/init.d at
+	shutdown.
+
 	Updated/fixed packages: barebox, bash, binutils, bison,
 	coreutils, dbus-glib, diffutils, dropbear, ebtables, ffmpeg,
 	flex, fluxbox, gawk, grep, gst-dsp, gst-ffmpeg, htop,
-- 
1.7.4.1
