From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:56 +0100
Subject: [Buildroot] [git commit] pkg-config: unbreak host build after
	auto-host-deps change
Message-ID: <20120118150408.4940F90385@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7544cf97e63fb07a86a834873fb8df7709e18ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-config/pkg-config.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/pkg-config/pkg-config.mk b/package/pkg-config/pkg-config.mk
index f347a53..137800c 100644
--- a/package/pkg-config/pkg-config.mk
+++ b/package/pkg-config/pkg-config.mk
@@ -17,6 +17,7 @@ HOST_PKG_CONFIG_CONF_OPT = \
 		--disable-static
 
 HOST_PKG_CONFIG_AUTORECONF = YES
+HOST_PKG_CONFIG_DEPENDENCIES =
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
