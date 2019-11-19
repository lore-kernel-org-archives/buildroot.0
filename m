From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Nov 2019 17:34:22 +0100
Subject: [Buildroot] [git commit] package/python-bunch: add to
 package/Config.in
Message-ID: <20191202083933.E306680DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fd8db02ef67bbd6b8fa853e957d32d036e291dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was missing from commit 8f15dd35ef659cffa6e6d25cde38c9a0248f2b5f.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 48c5bcec39..36d2b31e2e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -854,6 +854,7 @@ menu "External python modules"
 	source "package/python-bluezero/Config.in"
 	source "package/python-bottle/Config.in"
 	source "package/python-brotli/Config.in"
+	source "package/python-bunch/Config.in"
 	source "package/python-cached-property/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-cbor/Config.in"
