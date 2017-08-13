From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 13 Aug 2017 17:26:57 +0200
Subject: [Buildroot] [git commit branch/next] package/tor: bump version to
	0.3.0.10
Message-ID: <20170813154723.77108817B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e40f8cf77cacdfd5027199ebe8584c33c16b9d3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://blog.torproject.org/blog/tor-03010-released

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 618acdc..3252306 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 48d4880bf6ccb19ce9af2abde6946d7cf0635cc807548badbf4a221a79581e42  tor-0.3.0.9.tar.gz
+sha256 9a8e6e49a1688dae64dca10f84a414ec9a4f393fb2256ae28e0c2e3239185ab1  tor-0.3.0.10.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 0fa17e6..3a4c52e 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.0.9
+TOR_VERSION = 0.3.0.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
