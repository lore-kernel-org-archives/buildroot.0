From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:29:50 +0200
Subject: [Buildroot] [git commit] luacrypto: add hash file
Message-ID: <20150727203134.ABB3E7F918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f16b56646a094584b4ebffb30075bc25ee7b536f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luacrypto/luacrypto.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/luacrypto/luacrypto.hash b/package/luacrypto/luacrypto.hash
new file mode 100644
index 0000000..5c57767
--- /dev/null
+++ b/package/luacrypto/luacrypto.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	dc935c923b8851208d5d504b343448a9d5bd3e537bb8657875f12d72155600b8  luacrypto-0.3.2-1.src.rock
