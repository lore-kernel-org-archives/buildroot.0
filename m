From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 18:34:13 +0200
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.5.8
Message-ID: <20210511161118.55FEF870F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=294e939a5136684a84a0dff728f5e4a7f014509e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://blog.torproject.org/node/2031

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index e46335f79c..dd20bbc92e 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  447fcaaa133e2ef22427e98098a60a9c495edf9ff3e0dd13f484b9ad0185f074  tor-0.4.5.7.tar.gz
+sha256  57ded091e8bcdcebb0013fe7ef4a4439827cb169358c7874fd05fa00d813e227  tor-0.4.5.8.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6eed5e4a47..4a16967d42 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.5.7
+TOR_VERSION = 0.4.5.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
