From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:54:58 +0200
Subject: [Buildroot] [git commit] atop: add hash for license file
Message-ID: <20170706195216.0B39A81841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6473a185cef48a18c2cb611cf36a06dae050809c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atop/atop.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 7a7bffb..9ee0d62 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,2 +1,5 @@
 # Locally computed:
 sha256  73e4725de0bafac8c63b032e8479e2305e3962afbe977ec1abd45f9e104eb264  atop-2.3.0.tar.gz
+
+# Hash for license file:
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
