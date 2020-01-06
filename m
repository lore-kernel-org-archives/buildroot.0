From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:28:39 +0100
Subject: [Buildroot] [git commit] DEVELOPERS: Fix warning with get-developers
Message-ID: <20200106221854.10F32829FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9295f6465042432c0ca02157b9c03a4f38c49c00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

erlang-p1-iconv does not exist as a package in buildroot and cause warning
with get-developers :

./utils/get-developers -p erlang-p1-iconv
WARNING: 'package/erlang-p1-iconv/' doesn't match any file

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d0e915779a..00c4cdc1a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1264,7 +1264,6 @@ F:	package/erlang-jose/
 F:	package/erlang-lager/
 F:	package/erlang-p1-acme/
 F:	package/erlang-p1-cache-tab/
-F:	package/erlang-p1-iconv/
 F:	package/erlang-p1-mqtree/
 F:	package/erlang-p1-oauth2/
 F:	package/erlang-p1-pkix/
