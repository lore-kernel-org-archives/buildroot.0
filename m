From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jun 2015 16:19:01 +0200
Subject: [Buildroot] [git commit] package/libtirpc: bump version
Message-ID: <20150615141908.8AA6F80809@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f44f95dd9807f167ca373d9d23f1970a22c88b82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 0.3.1:
  - update our patches
  - rename patches for proper numbering
  - drop patch 0007, applied upstream

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...able-parts-of-TIRPC-requiring-NIS-support.patch |   64 ++++----------------
 ...out-RPC-support-does-not-install-rpcent.h.patch |   16 +++--
 ...dd-rpcgen-program-from-nfs-utils-sources.patch} |   17 +++--
 ...y-generate-XDR-header-files-from-.x-sour.patch} |   49 +++++++--------
 ...-files-needed-to-build-rpcbind-on-top-of.patch} |   24 ++++----
 ...g-config-needs-pthread-as-private-library.patch |   36 -----------
 package/libtirpc/libtirpc.hash                     |    4 +-
 package/libtirpc/libtirpc.mk                       |    2 +-
 8 files changed, 70 insertions(+), 142 deletions(-)

Patch is too large, so refusing to show it
