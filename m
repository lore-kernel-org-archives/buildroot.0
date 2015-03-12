From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Mar 2015 23:52:12 +0100
Subject: [Buildroot] [git commit] busybox: enable arp applet
Message-ID: <20150312225243.1B55A8040C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6407a0070ff6ba6626bbbf2e0271c38c88c52a83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's pretty common, small and useful, specially since busybox ip doesn't
do neigh (and looking at /proc/net/arp is all fine but not very
friendly).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 20b8c1d..9d930d1 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -767,7 +767,7 @@ CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 # CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
-# CONFIG_ARP is not set
+CONFIG_ARP=y
 CONFIG_ARPING=y
 # CONFIG_BRCTL is not set
 # CONFIG_FEATURE_BRCTL_FANCY is not set
