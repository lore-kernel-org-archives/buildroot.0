From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:32:23 +0200
Subject: [Buildroot] [git commit] mono: add hashes for license files
Message-ID: <20180605163105.8ACE780DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8594bef06bb1e680137bf1963a3d63363a47415
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/mono.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mono/mono.hash b/package/mono/mono.hash
index 47e34424ad..2cde7b6b21 100644
--- a/package/mono/mono.hash
+++ b/package/mono/mono.hash
@@ -1,2 +1,5 @@
 # sha256 locally computed
 sha256 f0636baa0c1399805526142e799cb697ddccf736e506cf1a30a870eaa2830a89  mono-5.12.0.226.tar.bz2
+sha256 3b40a54878b5ac2767a764bd082f8772ab27c03b9da9c7328c4c4935725556f7  LICENSE
+sha256 fc488f3ec9f36856bea8cce5cdde1449176341ef93a3962b691970f8981799f4  mcs/COPYING
+sha256 2c3c3ef532828bcd42bb3127349625a25291ff5ae7e6f8d42e0fe9b5be836a99  external/Newtonsoft.Json/Tools/7-zip/copying.txt
