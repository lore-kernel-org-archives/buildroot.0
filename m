From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 14:19:30 +0100
Subject: [Buildroot] [git commit] network-manager: add hash file
Message-ID: <20150316132003.162CC817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c511ca937d4627df7d601a999945faa20fe4cc8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix hash origin, as noted by Baruch, upstream publishes a
hash file so there's no need to compute it locally.]

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/network-manager.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
new file mode 100644
index 0000000..07513a9
--- /dev/null
+++ b/package/network-manager/network-manager.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  3a66afec670c975edd9832e620b725a5f16ed267a1b9e1b2d51ef27250d85947  NetworkManager-1.0.0.tar.xz
