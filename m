From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Dec 2017 19:56:37 +0100
Subject: [Buildroot] [git commit] cryptsetup: add json-c dependency to host
 build
Message-ID: <20171226185839.9A14B83563@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19dd7f602579780810e538e55502d419dddd946b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ecf/ecf5d87791e0255c3fce117447105db88749f796/
http://autobuild.buildroot.net/results/384/38462d222f2a893d44de894c30dc1e53d09c377d/
http://autobuild.buildroot.net/results/c29/c2901415345d94ef2135e460f4c78c21ae7ad09a/
... and many more.

Cc: Martin Hicks <mort@bork.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 1abee0b..0d8480b 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -33,6 +33,7 @@ HOST_CRYPTSETUP_DEPENDENCIES = \
 	host-lvm2 \
 	host-popt \
 	host-util-linux \
+	host-json-c \
 	host-openssl
 
 HOST_CRYPTSETUP_CONF_OPTS = --with-crypto-backend=openssl
