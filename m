From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:37:11 +0200
Subject: [Buildroot] [git commit branch/next] polkit: add hash file
Message-ID: <20150808105647.B0D3580741@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b123c9f04d3c9f6d821c7582f9f9b3458b05a2c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/polkit/polkit.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/polkit/polkit.hash b/package/polkit/polkit.hash
new file mode 100644
index 0000000..5e133b4
--- /dev/null
+++ b/package/polkit/polkit.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	36607c8ce576980ee55bd12bab1944f13217eb8e9d04ab56022545861ece3bc5	polkit-0.103.tar.gz
