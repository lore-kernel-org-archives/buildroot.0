From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jan 2016 23:01:40 +0100
Subject: [Buildroot] [git commit] package/odhcp6c: add hash
Message-ID: <20160201224701.CF1C67F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcea65ea7f821b98f97e9187bd4392d665e5eb7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/odhcp6c/odhcp6c.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
new file mode 100644
index 0000000..00a0960
--- /dev/null
+++ b/package/odhcp6c/odhcp6c.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	b5f920ed300309d65e431a360cae5f3c2010eca09a4231c9ef907c730d3c0d09	odhcp6c-dc186d6d2b0dd4ad23ca5fc69c00e81f796ff6d9.tar.gz
