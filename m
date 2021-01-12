From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 12 Jan 2021 19:11:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-capnproto: fix tarball hash
Message-ID: <20210112181159.12172-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5b95a5dc27c0d8002c00bda1c867ddea9218087e seems to have made a
mistake in the tarball hash

Fixes:
 - http://autobuild.buildroot.org/results/2de9c6c8ce83569d18cc7140ebc60d6fe1aadcbf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-capnproto/c-capnproto.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
index e215400ce5..493b45c7cd 100644
--- a/package/c-capnproto/c-capnproto.hash
+++ b/package/c-capnproto/c-capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz
+sha256  6913e2016b89987861566b1d0efe935fee1604bd3fb847cabaef354a9516d57b  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz
 sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
-- 
2.29.2
