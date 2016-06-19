From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:10:16 +0200
Subject: [Buildroot] [git commit] package/at91bootstrap: add hash file
Message-ID: <20160619194717.C48A381DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a51811a1d80eceaa1f1a8e329196a4982f07b96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91bootstrap/at91bootstrap.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/at91bootstrap/at91bootstrap.hash b/boot/at91bootstrap/at91bootstrap.hash
new file mode 100644
index 0000000..b1f963b
--- /dev/null
+++ b/boot/at91bootstrap/at91bootstrap.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  d66192a274247f4baa39fa932eadf903d7add55641d89d30402f967c4f2282a5  AT91Bootstrap1.16.zip
