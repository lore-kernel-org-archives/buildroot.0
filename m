From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:50:29 +0200
Subject: [Buildroot] [git commit] package/binutils: add hashes
Message-ID: <20150425095654.EB88680836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3e3a58535700581a870baa5ccacb6573e700621
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.hash |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
new file mode 100644
index 0000000..028fc10
--- /dev/null
+++ b/package/binutils/binutils.hash
@@ -0,0 +1,7 @@
+# From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
+sha512  ffe8ef263ef99183e8cc823fe8487ff7d0f7bf9a8efd2853b5f4636aca0023850d13de4eac7d77a5f69413d8a50e6f95bb14569be53df86c0bce38034525ab74  binutils-2.22.tar.bz2
+sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0a4ba38c43d2434da007137780cfe674de5414be5cf7ce7fbc6af6d16  binutils-2.23.2.tar.bz2
+sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
+sha512  49438970642f379978aba988e3d2e7b63dab6fd0b46d91f4100f083e87a84d242089daca58572245fe620457a77bbbe2d78588ff3fb79314e500d1a39bf96f30  binutils-2.25.tar.bz2
+# No hash for the ARC variant, comes from the github-helper:
+none   xxx                                                               binutils-arc-2014.12.tar.gz
