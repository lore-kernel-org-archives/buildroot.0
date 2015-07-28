From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:10 +0200
Subject: [Buildroot] [git commit branch/next] neard: add hash file
Message-ID: <20150808105647.1798B7FD56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=60fde9af56872f5a399727786b5267272c282d07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neard/neard.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/neard/neard.hash b/package/neard/neard.hash
new file mode 100644
index 0000000..7517093
--- /dev/null
+++ b/package/neard/neard.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/network/nfc/sha256sums.asc
+sha256	6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca	neard-0.14.tar.xz
