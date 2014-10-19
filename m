From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:35:12 +0200
Subject: [Buildroot] [git commit] nettle: add hash file
Message-ID: <20141019153637.44937AF9BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=880bdc7fdbf0c2291d614a442eb002bceaba25a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nettle/nettle.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
new file mode 100644
index 0000000..34c3862
--- /dev/null
+++ b/package/nettle/nettle.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40	nettle-2.7.1.tar.gz
