From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Mar 2020 00:08:41 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/tor: security
 bump version to 0.4.2.7
Message-ID: <20200328070936.A35618869B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8e8d4c7bf3eed6336a342d31ad757b2d9eb9255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes: https://blog.torproject.org/new-releases-03510-0419-0427

Fixes CVE-2020-10592 & CVE-2020-10593.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash files]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b356d9f92be20971877cd0657c4a9bd080056de1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 94cb8325ff..e55f3ea3c2 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 0500102433849bbe3231c590973d126c2d2d6b3943b4b9f9962bdb108436e6c4  tor-0.4.2.6.tar.gz
-sha256 ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
+sha256  06a1d835ddf382f6bca40a62e8fb40b71b2f73d56f0d53523c8bd5caf9b3026d  tor-0.4.2.7.tar.gz
+sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index d1caf35a9a..09f780d3f5 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.2.6
+TOR_VERSION = 0.4.2.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
