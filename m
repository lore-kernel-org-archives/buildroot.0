From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:42:49 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] libtirpc: use rpcgen from
 host-nfs-utils
Message-ID: <20180617150240.CEFE481213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=810392718cd968f84233559bf3019eed214d9cf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Drop the patch adding local rpcgen. Instead use the host-nfs-utils
provided rpcgen. Update the patch "Automatically generate XDR header
files from .x sources using" to use external rpcgen.

Renumber the other patches.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0965080fbcaf9e3f168a799cce0eefbc76c8e5a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Add-rpcgen-program-from-nfs-utils-sources.patch | 6508 --------------------
 ...y-generate-XDR-header-files-from-.x-sour.patch} |   35 +-
 ...-files-needed-to-build-rpcbind-on-top-of.patch} |    0
 ...005-Disable-DES-authentification-support.patch} |    0
 ...h => 0006-include-stdint.h-for-uintptr_t.patch} |    0
 package/libtirpc/libtirpc.mk                       |    1 +
 6 files changed, 18 insertions(+), 6526 deletions(-)

Patch is too large, so refusing to show it
