From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:45 -0000
Subject: [Buildroot] [git commit branch/next] lxc: add hash file
Message-ID: <20150808105635.E64C2818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cac00faab6185a566d0a995126aeb0fe4489474
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lxc/lxc.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
new file mode 100644
index 0000000..dcc532c
--- /dev/null
+++ b/package/lxc/lxc.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256 34ba517ffd7b38a14e5d12d56a4928b78602d56311d5f47c3ef90f4e714b9604 lxc-1.1.2.tar.gz
