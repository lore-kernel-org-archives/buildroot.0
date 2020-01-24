From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 24 Jan 2020 20:57:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/libnss: rename patch number
Message-ID: <20200124195704.115545-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the moment there are 2 patches with the same id(0001-xxx.patch) so
let's rename one of them to 0002-xxx.patch.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...> 0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/libnss/{0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch => 0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} (100%)

diff --git a/package/libnss/0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch b/package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
similarity index 100%
rename from package/libnss/0001-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
rename to package/libnss/0002-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch
-- 
2.20.1
