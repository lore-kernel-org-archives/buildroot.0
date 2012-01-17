From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:33 +0100
Subject: [Buildroot] [git commit] fontconfig: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.589239036D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7143fd26c57484c01a7fbdf013118ed81e3aea2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fontconfig/fontconfig.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index fc6ad68..39815ed 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -22,7 +22,6 @@ FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
 
 FONTCONFIG_DEPENDENCIES = freetype expat
 
-HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat
 HOST_FONTCONFIG_CONF_OPT = \
 		--disable-docs \
 		--disable-static
