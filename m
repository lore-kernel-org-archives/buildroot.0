From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 09:29:03 +0100
Subject: [Buildroot] [git commit] manual/make-tips.txt: fix typo
Message-ID: <20140329092228.D21009C3AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a855f639155c684e1fab3f74dbd932a7694aeb7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/make-tips.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
index faf59f2..81edae3 100644
--- a/docs/manual/make-tips.txt
+++ b/docs/manual/make-tips.txt
@@ -32,7 +32,7 @@ The result of the search shows the help message of the matching items.
 Not all targets are always available,
 some settings in the +.config+ file may hide some targets:
 
-* +busybox-menuconfig+ and +busybox-savedefconfig+ ony work when
+* +busybox-menuconfig+ and +busybox-savedefconfig+ only work when
   +busybox+ is enabled;
 * +linux-menuconfig+ and +linux-savedefconfig+ only work when
   +linux+ is enabled;
