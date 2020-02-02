From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Feb 2020 09:03:21 +0100
Subject: [Buildroot] [git commit] package/libnss: rename patch number
Message-ID: <20200202075252.A08058819D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efa528e1c9bc98b8bdeda15b402b3decd6aaec27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

At the moment there are 2 patches with the same id(0001-xxx.patch) so
let's rename one of them to 0002-xxx.patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ....patch => 0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libnss/0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
similarity index 100%
rename from package/libnss/0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
rename to package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
