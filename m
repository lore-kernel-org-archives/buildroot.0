From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:06 +0200
Subject: [Buildroot] [git commit] macchanger: add hash file
Message-ID: <20150728204048.186F37F9DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0459dbfbdeaf2d36e5bc5149c1481bb245a6f097
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/macchanger/macchanger.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/macchanger/macchanger.hash b/package/macchanger/macchanger.hash
new file mode 100644
index 0000000..d0b6f35
--- /dev/null
+++ b/package/macchanger/macchanger.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	31534f138f1d21fa247be74ba6bef3fbfa47bbcd5033e99bd10c432fe58e51f7	macchanger-1.6.0.tar.gz
