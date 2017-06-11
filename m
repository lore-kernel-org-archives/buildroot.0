From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:29:29 +0200
Subject: [Buildroot] [git commit] package/mmc-utils: add hash
Message-ID: <20170611123754.475157FAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3eb1e5378bedf20c4297260c26dc6a1eb3378bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mmc-utils/mmc-utils.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
new file mode 100644
index 0000000..a429079
--- /dev/null
+++ b/package/mmc-utils/mmc-utils.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4e5018e70f134b8c7ed05c84fca4b29fdce2ef2ca5abc0b9765939e6d8c3d912  mmc-utils-2cb6695e8dec00d887bdd5309d1b57d836fcd214.tar.gz
