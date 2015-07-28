From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:32:57 +0200
Subject: [Buildroot] [git commit branch/next] libunwind: add hash file
Message-ID: <20150808105646.66C96818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ae491ec2f6618fe8e5c4f3f935cbf333431b316d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libunwind/libunwind.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash
new file mode 100644
index 0000000..7ec47fa
--- /dev/null
+++ b/package/libunwind/libunwind.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a  libunwind-1.1.tar.gz
