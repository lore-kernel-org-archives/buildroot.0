From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] gpm: add comment mmu depends
Message-ID: <20140804163002.61C4D9D3A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b691edfe42af507ceed750650ca8d38aa62d469
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gpm/Config.in b/package/gpm/Config.in
index 0a60f6a..0148c13 100644
--- a/package/gpm/Config.in
+++ b/package/gpm/Config.in
@@ -23,3 +23,4 @@ endif
 
 comment "gpm mouse server needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
+	depends on BR2_USE_MMU
