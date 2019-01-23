From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 22:50:35 +0100
Subject: [Buildroot] [git commit] musl: fix hash of license file
Message-ID: <20190123215314.0FFE0813FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5cad242d65be46e726ee0cb986355e0d3d82a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

COPYRIGHT file has been updated between version 1.1.20 and 1.1.21:
https://git.musl-libc.org/cgit/musl/commit/COPYRIGHT?id=c50985d5c8e316c5c464f352e79eeebfed1121a9

Fixes:
 - http://autobuild.buildroot.org/results/8cfa70b906221442c9e6dfd46b64011c987d24bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/musl.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 18e011a965..9121424657 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature from
 # http://www.musl-libc.org/releases/musl-1.1.21.tar.gz.asc
 sha256  c742b66f6f49c9e5f52f64d8b79fecb5a0f6e0203fca176c70ca20f6be285f44  musl-1.1.21.tar.gz
-sha256  15d9afbf84041872b4d840ed7d165d3eee786ff3f97e703b10467c259ff4e7d9  COPYRIGHT
+sha256  a3ae1b9fc5d4938f5734734383b9813d27a5652df23010c6f9d4c5419b239a41  COPYRIGHT
