From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 17 Jan 2012 08:18:37 +0100
Subject: [Buildroot] [PATCH] sane-backends: mention in help message which
	libraries may be selected
In-Reply-To: <20120116093410.8B8EB90356@busybox.osuosl.org>
References: <20120116093410.8B8EB90356@busybox.osuosl.org>
Message-ID: <1326784717-1571-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sane-backends/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
index fb73435..35f3cf6 100644
--- a/package/sane-backends/Config.in
+++ b/package/sane-backends/Config.in
@@ -5,3 +5,7 @@ config BR2_PACKAGE_SANE_BACKENDS
 	  SANE - Scanner Access Now Easy
 
 	  http://www.sane-project.org
+
+	  Backends are included automatically based on the libraries that have
+	  been selected: libusb, jpeg, tiff, avahi (with dbus and libglib2),
+	  and netsnmp.
-- 
1.7.8.3
