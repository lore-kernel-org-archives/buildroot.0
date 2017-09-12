From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 23:31:30 +0200
Subject: [Buildroot] [git commit] package/zeromq: bump version to 4.1.6
Message-ID: <20170912212658.9AE3081032@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fa03d958b347e6b294a19a1709905045d9b9c20a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zeromq/zeromq.hash | 4 ++--
 package/zeromq/zeromq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 76067d9..486656e 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,4 +1,4 @@
 # From https://github.com/zeromq/zeromq4-1/releases
-sha1	2b7490b77860be3060b1b1f92cd73184d309ca69	zeromq-4.1.5.tar.gz
+sha1 b956df8c6f77c174683b51fbee67f99c94945651  zeromq-4.1.6.tar.gz
 # Calculated based on the hash above
-sha256	04aac57f081ffa3a2ee5ed04887be9e205df3a7ddade0027460b8042432bdbcf	zeromq-4.1.5.tar.gz
+sha256 02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a  zeromq-4.1.6.tar.gz
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 1d3be4e..caf5643 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.1.5
+ZEROMQ_VERSION = 4.1.6
 ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
