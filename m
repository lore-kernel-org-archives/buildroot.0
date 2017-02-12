From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Feb 2017 15:40:18 +0100
Subject: [Buildroot] [git commit branch/next] classpath: fix typo in
	CLASSPATH_CONF_OPTS definition
Message-ID: <20170212144106.F3478817A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=292998ca752a899ef0d91e2507e47535af7178ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This typo was introduced by commit
8f8c02e596e781df77b8cd7d5e7b3c33ae5e36b2 ("classpath: bump to version
0.99").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/classpath/classpath.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index 97b7f0d..e4cd0f8 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -11,7 +11,7 @@ CLASSPATH_CONF_OPTS = \
 	--disable-rpath \
 	--disable-Werror \
 	--disable-gconf-peer \
-	--disable-gjdoc
+	--disable-gjdoc \
 	--enable-tools
 
 # classpath assumes qt runs on top of X11, but we
