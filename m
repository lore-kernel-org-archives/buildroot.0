From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jun 2019 23:41:39 +0200
Subject: [Buildroot] [git commit] package/luv: update hash
Message-ID: <20190604214833.DE96081331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4a4d907ec1ca9741642953c0019444f34c91a75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed (using git force-push) and recreated version 1.29.1-1
and re-uploaded the source tarball. Therefore, the hash has changed and
needs to be updated.

See:
https://github.com/luvit/luv/issues/330

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luv/luv.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 507299f9df..02d61b0f24 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 430d5d8ad6b22e3e6284b8cdcfc7cea93e7459039bc12375a8a89bfbd034751c  luv-1.29.1-1.tar.gz
+sha256 572cf3887f4ca03d2761664aa8a098909b445164d8263015693893902558d4cd  luv-1.29.1-1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
