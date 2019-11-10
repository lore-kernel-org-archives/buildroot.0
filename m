From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Nov 2019 14:29:11 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Carlo Caione for jailhouse
Message-ID: <20191110132912.16295-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The jailhouse package was added in commit
ee4990721c14c624c99295598fde29e395647fb9 by Carlo Caione, but no entry
in the DEVELOPERS file was added. Let's fix this to ensure we have a
registered maintainer for the Jailhouse package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Carlo Caione <ccaione@baylibre.com>
---
Carlo, could you Acked-by this patch?

Also, if you're still using Jailhouse, it is typically the type of
package for which it would be useful to have a test in our runtime
test infrastructure (see support/testing). We are working on adding
documentation about this infrastructure, there's a documentation patch
being discussed on the mailing list.
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0863aabc6..991be89849 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -461,6 +461,7 @@ N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
 
 N:	Carlo Caione <carlo.caione@gmail.com>
+F:	package/jailhouse/
 F:	package/sunxi-boards/
 
 N:	Carlos Santos <unixmania@gmail.com>
-- 
2.21.0
