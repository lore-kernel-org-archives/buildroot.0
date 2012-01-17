From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 15:10:35 +0100
Subject: [Buildroot] [git commit] sane-backends: mention in help message
	which libraries may be selected
Message-ID: <20120117152637.85EEF9036D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b65e08c5764305f0bef34426b9cce5d77d6ebc9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sane-backends/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
index 03865d1..04222fc 100644
--- a/package/sane-backends/Config.in
+++ b/package/sane-backends/Config.in
@@ -4,3 +4,7 @@ config BR2_PACKAGE_SANE_BACKENDS
 	  SANE - Scanner Access Now Easy
 
 	  http://www.sane-project.org
+
+	  Backends are included automatically based on the libraries that have
+	  been selected: libusb, jpeg, tiff, avahi (with dbus and libglib2),
+	  and netsnmp.
