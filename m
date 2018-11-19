From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:13:30 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: update patch filename
Message-ID: <20181119211058.C28B183B07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28b725d27eaa1f3cdc21b58aa870b40e2d425665
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The patch 0007-Disable-DES-authentification-support.patch has been
renamed to 0005-Disable-DES-authentification-support.patch.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch b/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
index 344ba4ae94..6fe2d6e72b 100644
--- a/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
+++ b/package/ltp-testsuite/0001-rpc-tirpc-disable-tirpc_auth_authdes_-create-tests.patch
@@ -3,7 +3,7 @@ From: Erico Nunes <nunes.erico@gmail.com>
 Date: Fri, 30 Sep 2016 17:43:08 +0200
 Subject: [PATCH] rpc-tirpc: disable tirpc_auth_authdes_*create tests
 
-Due to Buildroot patch 0007-Disable-DES-authentification-support.patch on
+Due to Buildroot patch 0005-Disable-DES-authentification-support.patch on
 libtirpc, this library is built without method authdes_create. Any code
 that uses this library, like the rpc-tirpc testsuite, thus fails to link.
 
