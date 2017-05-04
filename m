From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:33:20 +0200
Subject: [Buildroot] [git commit] e2fsprogs: add empty lines to .mk file
Message-ID: <20170504203649.47F268257A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=854be948f8fa987876d6123381dd603e71360162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We usually have empty lines around multi-line variable definitions.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/e2fsprogs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 70a1e4e..84af7ab 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -84,10 +84,12 @@ E2FSPROGS_CONF_ENV += LIBS=-lintl
 endif
 
 E2FSPROGS_MAKE_OPTS = LDCONFIG=true
+
 E2FSPROGS_INSTALL_STAGING_OPTS = \
 	DESTDIR=$(STAGING_DIR) \
 	LDCONFIG=true \
 	install-libs
+
 E2FSPROGS_INSTALL_TARGET_OPTS = \
 	DESTDIR=$(TARGET_DIR) \
 	LDCONFIG=true \
