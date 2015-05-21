From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 19:12:08 +0200
Subject: [Buildroot] [git commit] package/luajit: fix typo in patchs commit
	log
Message-ID: <20150601220248.57B1F81D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0c83b0500512384ac841bb232581734f6587596
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luajit/0001-no-bin-symlink.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/luajit/0001-no-bin-symlink.patch b/package/luajit/0001-no-bin-symlink.patch
index 0de3162..6391f39 100644
--- a/package/luajit/0001-no-bin-symlink.patch
+++ b/package/luajit/0001-no-bin-symlink.patch
@@ -1,4 +1,4 @@
-Do not use a symlink for the binary, simply name if luajit
+Do not use a symlink for the binary, simply name it luajit
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
