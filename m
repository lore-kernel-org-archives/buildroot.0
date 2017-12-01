From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:00:57 -0000
Subject: [Buildroot] [git commit] libpjsip: remove deprecated config options
Message-ID: <20171201205331.4E4857FEE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3af2a3437f19babfcda5377d4e1b16a894af7a86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

disable-small-filter and disable-large-filter have been deprecated as
of 2.7, causing messages during compile time complaining about how they
are deprecated and have no effect.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpjsip/libpjsip.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 6f3f9e3..c772d41 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -38,8 +38,6 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-opus \
 	--disable-oss \
 	--disable-ext-sound \
-	--disable-small-filter \
-	--disable-large-filter \
 	--disable-g711-codec \
 	--disable-l16-codec \
 	--disable-g722-codec \
