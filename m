From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Aug 2016 11:56:11 +0200
Subject: [Buildroot] [git commit] iputils: fix typo in libintl comment
Message-ID: <20160826095718.06E0E8219D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fc926dbd11dc9239e209f6da028c4cb796e5577
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sentence should end with a dot (.) and not a comma (,).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 42dab08..0a89120 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -39,7 +39,7 @@ IPUTILS_DEPENDENCIES += libgcrypt
 # When gettext is enabled (BR2_PACKAGE_GETTEXT=y), and provides libintl
 # (BR2_NEEDS_GETTEXT=y), libgpg-error will link with libintl, and libgpg-error
 # is pulled in by libgcrypt. Since iputils doesn't use libtool, we have to link
-# with libintl explicitly for static linking,
+# with libintl explicitly for static linking.
 ifeq ($(BR2_STATIC_LIBS)$(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT),yyy)
 IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
 endif
