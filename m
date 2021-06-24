From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 13:55:38 +0200
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.5.9
Message-ID: <20210624113013.40BA483EF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1a445621e8f2f5b96e7814e152bf8b237ea28a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://blog.torproject.org/node/2041

Fixes CVE-2021-34548 (TROVE-2021-003), TROVE-2021-004, CVE-2021-34549
(TROVE-2021-005) & CVE-2021-34550 (TROVE-2021-006).

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index dd20bbc92e..8622281c2c 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  57ded091e8bcdcebb0013fe7ef4a4439827cb169358c7874fd05fa00d813e227  tor-0.4.5.8.tar.gz
+sha256  f304e456102ed26c39e5f16ece2115585398cdb4e67455139c86ea43cdf70856  tor-0.4.5.9.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 4a16967d42..e7e791a10a 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.5.8
+TOR_VERSION = 0.4.5.9
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
