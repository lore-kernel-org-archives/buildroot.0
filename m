From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:29:29 +0200
Subject: [Buildroot] [git commit] package/libuci: add hash
Message-ID: <20170611123754.2292C7F94F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1db4bdf29c45c2c743f9c807f6e3507f3a91ef3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
new file mode 100644
index 0000000..d4c839e
--- /dev/null
+++ b/package/libuci/libuci.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 bb9827863c6b7b6cf986a3de42b5716edb8a280e44b3ce39541de18062c3c00e  libuci-49ec6efbdac4819033d34f08927d795f83a3932d.tar.gz
