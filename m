From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jan 2014 20:44:15 +0100
Subject: [Buildroot] [git commit] netstat-nat: add license information
Message-ID: <20140119195139.A84EA9C546@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7110b4ad54f4667d3e32332a61991a9eeb0e4fb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netstat-nat/netstat-nat.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/netstat-nat/netstat-nat.mk b/package/netstat-nat/netstat-nat.mk
index d94c6f0..9a60f12 100644
--- a/package/netstat-nat/netstat-nat.mk
+++ b/package/netstat-nat/netstat-nat.mk
@@ -6,5 +6,7 @@
 
 NETSTAT_NAT_VERSION = 1.4.10
 NETSTAT_NAT_SITE = http://tweegy.nl/download
+NETSTAT_NAT_LICENSE = GPLv2+
+NETSTAT_NAT_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
