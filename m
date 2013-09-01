From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 1 Sep 2013 21:15:24 +0200
Subject: [Buildroot] [git commit] collectd: Config.in: fix space/tab mixup
Message-ID: <20130901194715.5CEF69B6B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c82ca4fec6a26356d5424feecf65a077c297d171
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/collectd/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 43571e3..4957115 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -429,5 +429,5 @@ endmenu
 endif
 
 comment "collectd needs a toolchain with IPv6 and thread support"
-        depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 	depends on BR2_USE_MMU
