From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 17 Jan 2012 23:32:31 +0100
Subject: [Buildroot] [git commit] atk: removed redundant
	HOST_FOO_DEPENDENCIES
Message-ID: <20120117224424.3004290370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62939dbd289f0fdc5e45d607669caf3aeaab6fc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index f0e96a5..d84d08c 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -52,8 +52,6 @@ endif
 
 ATK_DEPENDENCIES = libglib2 host-pkg-config
 
-HOST_ATK_DEPENDENCIES = host-libglib2 host-pkg-config
-
 HOST_ATK_CONF_OPT = \
 		--disable-glibtest
 
