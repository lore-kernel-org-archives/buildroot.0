From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 15:16:31 +0100
Subject: [Buildroot] [git commit] swupdate: remove empty line
Message-ID: <20180115142638.E215783C62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65793bab3d21b1a8d6091174eb2f57b6a8d61b51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Yann E. Morin running:

```
    $ ./utils/check-package package/swupdate/swupdate.mk
    package/swupdate/swupdate.mk:42: consecutive empty lines
    140 lines processed
    1 warnings generated
```

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/swupdate.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d1afbc4..aa232e5 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -39,7 +39,6 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
 endif
 
-
 ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
 SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
 # defines the base name for the pkg-config file ("lua" or "luajit")
