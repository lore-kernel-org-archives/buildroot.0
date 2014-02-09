From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 01:00:22 +0100
Subject: [Buildroot] [git commit] pkg-autotools: fixup pkg_CONFIGURE_CMDS
	after DISABLE_DOCUMENTATION removal
Message-ID: <20140209000138.2BD6C9C8DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e0cd2e289e5e20a1989d05337a754752c8d5738
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 6f52335..5f6c31d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -114,7 +114,7 @@ define $(2)_CONFIGURE_CMDS
 		--disable-docs \
 		--disable-documentation \
 		--with-xmlto=no \
-		--with-fop=no
+		--with-fop=no \
 		$$(DISABLE_NLS) \
 		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
