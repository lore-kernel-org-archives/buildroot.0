From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 22:42:44 +0100
Subject: [Buildroot] [git commit] spidev_test: add a hash file
Message-ID: <20151125214948.05ED481EC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a388405947d339c215d728a4016daa87588ce94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spidev_test/spidev_test.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/spidev_test/spidev_test.hash b/package/spidev_test/spidev_test.hash
new file mode 100644
index 0000000..6871288
--- /dev/null
+++ b/package/spidev_test/spidev_test.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
+sha256 57fa6c534e0b7b4d234075e18bc89e2f3c9fc4ecc27e80f349a8057708e0de46  spidev_test.c?id=v3.15
