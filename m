From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 22:13:00 +0200
Subject: [Buildroot] [git commit] package/dropbear: fix typo
Message-ID: <20200629201236.1284083F8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=feaba230ce442fc07e83cd9d4892a83edc6362c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was a missing space between the append-assignment operator, and
the appended list of licenses.

Even though inconsequential technically speaking, we always use spaces
around operators elsewhere in the code.

So be it here too.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dropbear/dropbear.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 2d0bd52ef8..3eaa98d0a4 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -79,7 +79,7 @@ DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_REVERSE_DNS
 endif
 
 ifeq ($(BR2_PACKAGE_DROPBEAR_SMALL),y)
-DROPBEAR_LICENSE +=, Unlicense, WTFPL
+DROPBEAR_LICENSE += , Unlicense, WTFPL
 DROPBEAR_LICENSE_FILES += libtommath/LICENSE libtomcrypt/LICENSE
 DROPBEAR_CONF_OPTS += --disable-zlib --enable-bundled-libtom
 else
