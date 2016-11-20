From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Nov 2016 23:34:21 +0100
Subject: [Buildroot] [git commit] libfribi: fix 'usptream' typo in comment
Message-ID: <20161120223457.6457A80142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f5f48199116119a2b69c42b95cee0594eee8774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfribidi/libfribidi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 86e722a..751a1b6 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -15,7 +15,7 @@ LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_AUTORECONF = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 # libglib2 dependency causes a build failure, and this optional
-# dependency is going to be removed usptream, see
+# dependency is going to be removed upstream, see
 # https://github.com/behdad/fribidi/pull/14
 LIBFRIBIDI_CONF_OPTS = --with-glib=no
 
