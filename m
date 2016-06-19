From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 21:11:25 +0200
Subject: [Buildroot] [git commit] package/at91dataflashboot: add hash file
Message-ID: <20160619194717.D034281DCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73fa3dc04067f3f036249d69c42baa846e5713fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91dataflashboot/at91dataflashboot.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/at91dataflashboot/at91dataflashboot.hash b/boot/at91dataflashboot/at91dataflashboot.hash
new file mode 100644
index 0000000..57df4e5
--- /dev/null
+++ b/boot/at91dataflashboot/at91dataflashboot.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  2cfeb6a9236e1a743c8010f05e504dbc92169ef42d9a6cf7948954a577bfc386  DataflashBoot-1.05.tar.bz2
